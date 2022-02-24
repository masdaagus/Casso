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
      backgroundColor: darkColor,
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
              Positioned(
                left: 32,
                bottom: Get.height * .49,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Color(0XFF38A9E1),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              Positioned(
                right: 8,
                bottom: Get.height * .21,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Color(0XFF8B8B8B).withOpacity(.8),
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Positioned(
                left: Get.width * .1,
                bottom: Get.height * .1,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Color(0XFFB44CC7).withOpacity(.8),
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 45,
                      sigmaY: 45,
                    ),
                    child: Container(
                      width: Get.width,
                      height: Get.height * .65,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            darkColor.withOpacity(.45),
                            darkColor.withOpacity(.35),
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
