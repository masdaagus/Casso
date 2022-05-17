import 'dart:developer';

import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:casso/app/modules/employe/bindings/pegawai_binding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/pegawai_view.dart';

class EmployeController extends GetxController {
  final auth = Get.find<AuthController>();

  var user = UsersModel().obs;
  var resto = RestosModel().obs;

  bool isLoading = false;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController? employeName;
  TextEditingController? employeId;
  TextEditingController? employePassword;
  String? employeStatus;

  var data = ['CASHIER', 'KICHEN', 'WAITERS'].obs;
  var selected = 'WAITERS'.obs;

  List<UsersModel> employes = [];

  Future<void> _initData() async {
    employes = resto.value.restoEmploye as List<UsersModel>;
  }

  List<String> images = [
    "assets/images/head_people.jpeg",
    "assets/images/avatar-2.png",
    "assets/images/avatar-3.png",
    "assets/images/avatar-1.png",
    "assets/images/avatar-4.png",
    "assets/images/avatar-2.png",
    "assets/images/avatar-3.png",
    "assets/images/avatar-1.png",
    "assets/images/avatar-4.png",
  ];

  Future<void> updateDataPegawai(UsersModel data) async {
    isLoading = true;
    update();

    CollectionReference restos = firestore.collection("restos");
    CollectionReference users = firestore.collection("users");

    List<UsersModel> employes = resto.value.restoEmploye as List<UsersModel>;

    UsersModel newUser = UsersModel(
      email: data.email,
      name: employeName!.text.trim(),
      password: employePassword!.text.trim(),
      status: data.status,
      restoID: data.restoID,
    );

    int iw = employes.indexWhere((usr) => usr.email == data.email);
    employes.removeAt(iw);
    employes.insert(iw, newUser);

    print('DATA EMAIL ${data.name}');
    print('TEXTFIELD ${employeName!.text}');

    if (data.name != employeName!.text ||
        data.password != employePassword!.text) {
      try {
        await restos.doc(user.value.uid).update({
          "restoEmploye": List<dynamic>.from(
            employes.map(
              (x) => x.toJson(),
            ),
          )
        });

        await users.doc(data.email).update({
          "name": newUser.name,
          "password": employePassword!.text.trim(),
          // "status": employeStatus ?? data.status,
        });

        final restoDoc = await restos.doc(user.value.restoID).get();
        final restoData = restoDoc.data() as Map<String, dynamic>;
        resto(RestosModel.fromJson(restoData));
        final userDocUpdate = await users.doc(user.value.email).get();
        final userDataUpdate = userDocUpdate.data() as Map<String, dynamic>;
        user(UsersModel.fromJson(userDataUpdate));
        user.refresh();
        resto.refresh();
        auth.refresh();
        auth.update();
        isLoading = false;
        update();
        Get.offAll(() => EmployeView(), binding: PegawaiBinding());
      } catch (e) {
        log(e.toString());
      }
    } else {
      isLoading = false;
      update();
      Get.snackbar('NO', 'message');
    }
  }

  void tes() {}

  @override
  void onInit() async {
    user = auth.user;
    resto = auth.resto;
    await _initData();
    super.onInit();
  }

  @override
  void onClose() {
    employeName?.dispose();
    employeId?.dispose();
    employePassword?.dispose();
    super.onClose();
  }
}
