import 'package:casso/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/login_controller.dart';
import 'components/card_login.dart';

class LoginView extends GetView<LoginController> {
  final auth = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF393543),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Lottie asset
                Lottie.asset("assets/lottie/burger.json"),

                // card login
                CardLogin(loginWithGoogle: () => auth.login()),
                SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
