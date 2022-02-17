import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController {
  final auth = Get.find<AuthController>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  UsersModel user = UsersModel();
  late TextEditingController restoName;
  late TextEditingController restoLocation;
  late TextEditingController restoTable;

  Future<void> getResto() async {
    CollectionReference restos = firestore.collection("restos");
    CollectionReference users = firestore.collection("users");

    // / update users untuk menambahkan resto id
    await users.doc(user.email).update({
      "restoID": user.uid,
    });

    /// set resto
    await restos.doc(user.uid).set({
      "restoName": restoName.text,
      "resto:ocation": restoLocation.text,
      "restoTable": restoTable.value.text,
    });
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
