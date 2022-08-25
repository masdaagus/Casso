import 'dart:developer';

import 'package:casso/app/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/model/user_model.dart';
import '../../../data/models/resto.dart';
import '../../../data/models/users.dart';
import '../../../utils/constant.dart';

class LoginController extends GetxController {
  final auth = Get.find<AuthController>();
  var user = UserModel().obs;

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
      await user(UserModel.fromJson(userData));
      user.refresh();

      if (user.value.email == null) {
        return false;
      } else {
        emailValidation = null;
        if (_email == user.value.email) {
          final box = GetStorage();
          if (box.read(emailKey) != null && box.read(passwordKey) != null) {
            box.remove(emailKey);
            box.remove(passwordKey);
          }
          await box.write(emailKey, _email);
          await box.write(passwordKey, _password);

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

  // Future<UserModel> registerController() async {
  //   final usr = await auth.register(email: '', password: '');
  //   if (usr != null) {
  //     return user.value = usr;
  //   } else {
  //     return UserModel();
  //   }
  // }

  @override
  void onInit() {
    user = auth.user;
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
