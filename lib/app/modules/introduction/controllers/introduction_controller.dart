import 'dart:math';

import 'package:casso/app/controllers/auth_controller.dart';
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

  var resto = Resto().obs;

  late TextEditingController restoName;
  late TextEditingController restoLocation;
  late TextEditingController restoTable;

  Future<void> setResto() async {
    CollectionReference restos = firestore.collection("restos");
    CollectionReference users = firestore.collection("users");

    Random r = Random();
    String rndm = List.generate(6, (_) => r.nextInt(9)).join("").toString();

    final List<dynamic> employe = [
      UsersModel(
        name: "barista.$rndm",
        email: "barista.123@gmail.com",
        status: "BARISTA",
        restoID: user.uid,
        password: '123456',
      ).toJson(),
      UsersModel(
        name: "kitchen.$rndm",
        email: "cashier.123@gmail.com",
        status: "KITCHEN",
        restoID: user.uid,
        password: '123456',
      ).toJson(),
      UsersModel(
        name: "cashier.$rndm",
        email: "cashier.123@gmail.com",
        status: "CASHIER",
        restoID: user.uid,
        password: '123456',
      ).toJson(),
      UsersModel(
        name: "waiters.$rndm",
        email: "cashier.123@gmail.com",
        status: "WAITERS",
        restoID: user.uid,
        password: '123456',
      ).toJson(),
      UsersModel(
        name: "waiters2.$rndm",
        email: "cashier.123@gmail.com",
        status: "WAITERS",
        restoID: user.uid,
        password: '123456',
      ).toJson(),
    ];

    try {
      // / update users untuk menambahkan resto id
      await users.doc(user.email).update({
        "restoID": user.uid,
      });

      try {
        /// memasukkan user ke collection users
        final check = await users.doc('cashier.$rndm').get();

        if (check.data() == null) {
          for (int i = 0; i < employe.length; i++) {
            await users.doc(employe[i]['name']).set(
                  UsersModel(
                    name: employe[i]['name'],
                    email: employe[i]['email'],
                    status: employe[i]['status'],
                    restoID: user.uid,
                    password: "123456",
                  ).toJson(),
                );
          }
        }

        /// set resto
        await restos.doc(user.uid).set({
          "ownerEmail": user.email,
          "ownerName": user.name,
          "restoName": restoName.text,
          "restoLocation": restoLocation.text,
          "restoTable": restoTable.text,
          "restoEmploye": employe,
        });
      } catch (e) {
        print(e);
      }
    } catch (e) {
      print(e);
    }

    Get.offAllNamed("/home");
  }

  @override
  void onInit() {
    user = auth.user.value;
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
