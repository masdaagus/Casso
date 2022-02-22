import 'dart:math';

import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/products.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController {
  final auth = Get.find<AuthController>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  UsersModel user = UsersModel();

  UserCredential? userCredential;

  var resto = RestosModel().obs;

  late TextEditingController restoName;
  late TextEditingController restoLocation;
  late TextEditingController restoTable;

  Future<void> setResto() async {
    CollectionReference restos = firestore.collection("restos");
    CollectionReference users = firestore.collection("users");

    Random r = Random();
    String rndm = List.generate(6, (_) => r.nextInt(9)).join("").toString();

    final List<ProductCategory> drink = [
      ProductCategory(foodName: "Teh Manis ", foodPrice: "5000"),
      ProductCategory(foodName: "Milkshake Jambu ", foodPrice: "30000"),
      ProductCategory(foodName: "Sanger", foodPrice: "12000"),
    ];
    final List<ProductCategory> food = [
      ProductCategory(foodName: "Nasi Goreng ", foodPrice: "12000"),
      ProductCategory(foodName: "Ikan Bakar ", foodPrice: "24000"),
      ProductCategory(foodName: "Ayam Penyet", foodPrice: "10000"),
    ];
    final List<ProductCategory> dessert = [
      ProductCategory(foodName: "Kentang Goreng ", foodPrice: "10000"),
      ProductCategory(foodName: "Bakso Bakar ", foodPrice: "10000"),
      ProductCategory(foodName: "Sate Taichan", foodPrice: "14000"),
    ];

    final products = Products(
      drink: drink,
      food: food,
      dessert: dessert,
    );
    final List<UsersModel> employe = [
      UsersModel(
        name: "barista.$rndm",
        email: "barista.$rndm@gmail.com",
        status: "BARISTA",
        restoID: user.uid,
        password: '123456',
      ),
      UsersModel(
        name: "kitchen.$rndm",
        email: "cashier.$rndm@gmail.com",
        status: "KITCHEN",
        restoID: user.uid,
        password: '123456',
      ),
      UsersModel(
        name: "cashier.$rndm",
        email: "cashier.$rndm@gmail.com",
        status: "CASHIER",
        restoID: user.uid,
        password: '123456',
      ),
      UsersModel(
        name: "waiters.$rndm",
        email: "cashier.$rndm@gmail.com",
        status: "WAITERS",
        restoID: user.uid,
        password: '123456',
      ),
      UsersModel(
        name: "waiters2.$rndm",
        email: "cashier.$rndm@gmail.com",
        status: "WAITERS",
        restoID: user.uid,
        password: '123456',
      ),
    ];

    try {
      // / update users untuk menambahkan resto id
      await users.doc(user.email).update({
        "restoID": user.uid,
      });

      try {
        /// memasukkan user ke collection users
        final check = await users.doc('cashier.$rndm').get();

        while (check.data() == null) {
          for (int i = 0; i < employe.length; i++) {
            await users.doc(employe[i].name).set(
                  UsersModel(
                    name: employe[i].name,
                    email: employe[i].email,
                    status: employe[i].status,
                    restoID: user.uid,
                    password: "123456",
                  ).toJson(),
                );
          }

          break;
        }

        /// set resto dengan model
        await restos.doc(user.uid).set(
              RestosModel(
                ownerEmail: user.email,
                ownerName: user.name,
                restoName: restoName.text,
                restoLocation: restoLocation.text,
                restoTable: restoTable.text,
                restoEmploye: employe,
                products: products,
              ).toJson(),
            );

        // memasukkan data resto user ke dalam model (agar bisa ditampilkan ke widget)
        final restoId = await restos.doc(user.restoID).get();
        final restoData = restoId.data() as Map<String, dynamic>;
        resto(RestosModel.fromJson(restoData));
        resto.refresh();
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
    user = auth.user.value;
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



   // if (check.data() == null) {
        //   for (int i = 0; i < employe.length; i++) {
        //     await users.doc(employe[i]['name']).set(
        //           UsersModel(
        //             name: employe[i]['name'],
        //             email: employe[i]['email'],
        //             status: employe[i]['status'],
        //             restoID: user.uid,
        //             password: "123456",
        //           ).toJson(),
        //         );
        //   }
        // }