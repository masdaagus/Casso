import 'dart:ui';

import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/modules/login/views/register_view.dart';

import 'package:casso/app/utils/constant.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import 'components/custom_textfield.dart';

import 'components/headline.dart';
import 'components/login_button.dart';
import 'components/login_google.dart';
import 'components/resgiter_button.dart';

class LoginView extends GetView<LoginController> {
  final auth = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: priColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 64),
                child: Image.asset(
                  "assets/images/Saly-22.png",
                  fit: BoxFit.cover,
                  width: size.width,
                  height: size.height * .4,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 25,
                      sigmaY: 25,
                    ),
                    child: Container(
                      width: Get.width,
                      height: Get.height * .65,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            priColor.withOpacity(.45),
                            priColor.withOpacity(.35),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            // HEADLINE TEXT CASSO
                            Headline(),

                            // TEXTFIELD EMAIL
                            CustomTextField(
                              hintText: "Email",
                              icon: Icons.person_outline_outlined,
                              controller: controller.emailController,
                            ),
                            // TEXTFIELD PASSWORD
                            GetBuilder<LoginController>(
                              builder: (c) {
                                return CustomTextField(
                                  hintText: "Password",
                                  icon: Icons.lock_outline_rounded,
                                  controller: controller.passwordController,
                                  isObsecure: c.isHide,
                                  isNumType: true,
                                  isCanHide: true,
                                  tapToHide: () => c.hide(),
                                );
                              },
                            ),
                            // BUTTON LOGIN
                            LoginButton(
                              onTap: () => auth.loginEmploye(
                                  controller.emailController.text,
                                  controller.passwordController.text),
                            ),
                            // BUTTON LOGIN WITH GOOGLE
                            LoginGoogleButton(
                              onTap: () => auth.loginWithGoogle(),
                            ),
                            // REGISTER
                            RegisterTextButton(
                              onTap: () => Get.to(() => RegisterView()),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
