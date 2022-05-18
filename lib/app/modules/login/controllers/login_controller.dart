import 'dart:developer';

import 'package:casso/app/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/resto.dart';
import '../../../data/models/users.dart';
import '../../../utils/constant.dart';

class LoginController extends GetxController {
  final auth = Get.find<AuthController>();

  var user = UsersModel().obs;
  var resto = RestosModel().obs;

  FirebaseFirestore db = FirebaseFirestore.instance;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  String? emailValidation;
  String? passwordValidation;

  bool isLoading = false;
  bool isHide = true;

  void hide() {
    isHide = !isHide;
    update();
  }

  Future<bool> login() async {
    CollectionReference users = db.collection("users");
    CollectionReference restos = db.collection("restos");

    String _email = emailController.text.trim();
    String _password = passwordController.text.trim();

    isLoading = true;
    update();

    try {
      final userDoc = await users.doc(_email).get();
      final userData = userDoc.data() as Map<String, dynamic>;
      await user(UsersModel.fromJson(userData));
      user.refresh();

      print(user.value.password);
      print(_password);
      print(user.value.password!.length);
      print(_password.length);

      bool x = user.value.password == _password;
      log("sama gak ${x.toString()}");

      if (user.value.email == null) {
        return false;
      } else {
        emailValidation = null;
        if (_email == user.value.email && _password == user.value.password) {
          final box = GetStorage();
          if (box.read(emailKey) != null && box.read(passwordKey) != null) {
            box.remove(emailKey);
            box.remove(passwordKey);
          }
          await box.write(emailKey, _email);
          await box.write(passwordKey, _password);

          final restoDoc = await restos.doc(user.value.restoID).get();
          final restoData = restoDoc.data() as Map<String, dynamic>;
          resto(RestosModel.fromJson(restoData));
          resto.refresh();
          auth.isAuth.value = true;
          auth.update();
          return true;
        } else {
          passwordValidation = 'password anda salah';

          isLoading = false;
          update();
          return false;
        }
      }
    } catch (e) {
      // emailValidation = 'error';
      emailValidation = 'Email or ID anda salah';
      isLoading = false;
      update();
      return false;
    }
  }

  @override
  void onInit() {
    user = auth.user;
    resto = auth.resto;
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
