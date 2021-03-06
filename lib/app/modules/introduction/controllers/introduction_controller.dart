import 'dart:math';

import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/product.dart';

import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/table.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:casso/app/utils/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController {
  final auth = Get.find<AuthController>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var user = UsersModel().obs;
  var resto = RestosModel().obs;

  final now = DateTime.now();

  UserCredential? userCredential;

  late TextEditingController restoName;
  late TextEditingController restoLocation;
  late TextEditingController restoTable;

  Future<void> setResto() async {
    CollectionReference restos = firestore.collection("restos");
    CollectionReference users = firestore.collection("users");

    Get.to(SplashScreen());

    Random r = Random();
    String rndm = List.generate(4, (_) => r.nextInt(9)).join("").toString();

    final List<Product> products = [
      Product(
          productName: 'Nasi Goreng',
          productPrice: 5000,
          productCategory: 'FOOD',
          productDescription: null,
          productStock: 100,
          productImage:
              'https://www.foodforfitness.co.uk/wp-content/uploads/2018/05/IMG_7741-2000x1333.jpg'),
      Product(
          productName: 'Teh Manis',
          productPrice: 5000,
          productCategory: 'DRINK',
          productDescription: null,
          productStock: 100,
          productImage:
              'https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/2020/10/13/1521986007.jpg'),
      Product(
          productName: 'Kentang Goreng',
          productPrice: 10000,
          productCategory: 'DESSERT',
          productDescription: null,
          productStock: 100,
          productImage:
              'https://1.bp.blogspot.com/-szZPDTLOWDU/V7pftmWHq2I/AAAAAAAAB-8/fLvvL88OLvghYxNbDlMx0NrYQsTd1iTuACLcB/s1600/69.-Cara-Mudah-Membuat-Kentang-Goreng-Renyah-di-Rumah.jpg'),
    ];
    final List<UsersModel> employe = [
      UsersModel(
        name: user.value.name,
        email: user.value.email,
        status: "OWNER",
        restoID: user.value.uid,
        password: '123456',
        uid: null,
      ),
      UsersModel(
        name: "Kitchen$rndm",
        email: "kitchen$rndm",
        status: "KITCHEN",
        restoID: user.value.uid,
        password: '123456',
        uid: null,
      ),
      UsersModel(
        name: "Cashier$rndm",
        email: "cashier$rndm",
        status: "CASHIER",
        restoID: user.value.uid,
        password: '123456',
        uid: null,
      ),
      UsersModel(
        name: "Waiter$rndm",
        email: "waiters$rndm",
        status: "WAITERS",
        restoID: user.value.uid,
        password: '123456',
        uid: null,
      ),
    ];

    final List<TableModel> tables = [];

    try {
      /// memasukkan user ke collection users
      final check = await users.doc('cashier.$rndm').get();

      while (check.data() == null) {
        for (int i = 1; i < employe.length; i++) {
          await users.doc(employe[i].email).set(
                UsersModel(
                  name: employe[i].name,
                  email: employe[i].email,
                  status: employe[i].status,
                  restoID: user.value.uid,
                  password: "123456",
                ).toJson(),
              );
        }

        break;
      }

      /// membuat panjang table
      int _tableLength = int.parse(restoTable.text);

      for (int i = 0; i < _tableLength; i++) {
        tables.add(TableModel(tableNumber: i + 1, guessName: null));
      }

      DateTime expAt = now.add(Duration(days: 24));

      /// set resto dengan model
      await restos.doc(user.value.uid).set(
            RestosModel(
              createAt: now.toIso8601String(),
              expiredAt: expAt.toIso8601String(),
              ownerEmail: user.value.email,
              ownerName: user.value.name,
              restoName: restoName.text,
              restoLocation: restoLocation.text,
              restoTable: _tableLength,
              restoEmploye: employe,
              products: products,
              tables: tables,
              restoTaxes: 0,
            ).toJson(),
          );

      // / update users untuk menambahkan resto id
      await users.doc(user.value.email).update({
        "restoID": user.value.uid,
      });

      // memasukkan data user ke dalam model (agar bisa ditampilkan ke widget)
      final userDoc = await users.doc(user.value.email).get();
      final userDocData = userDoc.data() as Map<String, dynamic>;
      user(UsersModel.fromJson(userDocData));
      user.refresh();

      // memasukkan data resto user ke dalam model (agar bisa ditampilkan ke widget)
      final restoId = await restos.doc(user.value.restoID).get();
      final restoData = restoId.data() as Map<String, dynamic>;

      resto(RestosModel.fromJson(restoData));
      resto.refresh();

      await FirebaseMessaging.instance.subscribeToTopic('masda');

      auth.isAuth.value = true;

      Get.offAllNamed("/home");
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    user = auth.user;
    resto = auth.resto;
    restoName = TextEditingController();
    restoLocation = TextEditingController();
    restoTable = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    restoName.dispose();
    restoLocation.dispose();
    restoTable.dispose();
    super.onClose();
  }
}
