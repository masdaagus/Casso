import 'dart:math';

import 'package:casso/app/controllers/auth_controller.dart';

import 'package:casso/app/data/models/products.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/table.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController {
  final auth = Get.find<AuthController>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var user = UsersModel().obs;
  var resto = RestosModel().obs;

  UserCredential? userCredential;

  late TextEditingController restoName;
  late TextEditingController restoLocation;
  late TextEditingController restoTable;

  Future<void> setResto() async {
    CollectionReference restos = firestore.collection("restos");
    CollectionReference users = firestore.collection("users");

    Random r = Random();
    String rndm = List.generate(4, (_) => r.nextInt(9)).join("").toString();

    final List<ProductCategory> drink = [
      ProductCategory(foodName: "Teh Manis ", foodPrice: 5000),
      ProductCategory(foodName: "Lemon Tea", foodPrice: 10000),
    ];
    final List<ProductCategory> food = [
      ProductCategory(foodName: "Nasi Goreng ", foodPrice: 12000),
      ProductCategory(foodName: "Indomie Goreng", foodPrice: 10000),
    ];
    final List<ProductCategory> dessert = [
      ProductCategory(foodName: "Kentang Goreng ", foodPrice: 12000),
      ProductCategory(foodName: "Roti Bakar ", foodPrice: 10000),
    ];

    final products = Products(
      drink: drink,
      food: food,
      dessert: dessert,
    );
    final List<UsersModel> employe = [
      UsersModel(
        name: user.value.name,
        email: user.value.email,
        status: "OWNER",
        restoID: user.value.uid,
      ),
      UsersModel(
        name: "kitchen.$rndm",
        email: "kitchen.$rndm@gmail.com",
        status: "KITCHEN",
        restoID: user.value.uid,
        password: '123456',
      ),
      UsersModel(
        name: "cashier.$rndm",
        email: "cashier.$rndm@gmail.com",
        status: "CASHIER",
        restoID: user.value.uid,
        password: '123456',
      ),
      UsersModel(
        name: "waiters.$rndm",
        email: "waiters.$rndm@gmail.com",
        status: "WAITERS",
        restoID: user.value.uid,
        password: '123456',
      ),
    ];

    final List<TableModel> tables = [];

    try {
      // / update users untuk menambahkan resto id
      await users.doc(user.value.email).update({
        "restoID": user.value.uid,
      });

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
          tables.add(TableModel(tableNumber: i + 1));
          print(i);
          print(_tableLength);
        }

        /// set resto dengan model
        await restos.doc(user.value.uid).set(
              RestosModel(
                ownerEmail: user.value.email,
                ownerName: user.value.name,
                restoName: restoName.text,
                restoLocation: restoLocation.text,
                restoTable: _tableLength,
                restoEmploye: employe,
                products: products,
                tables: tables,
              ).toJson(),
            );

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

        auth.isAuth.value = true;

        Get.offAllNamed("/home");
      } catch (e) {
        print(e);
      }
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
