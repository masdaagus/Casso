import 'dart:ui';

import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/modules/login/controllers/login_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/custom_textfield.dart';
import 'components/headline.dart';
import 'components/login_button.dart';
import 'components/login_google.dart';
import 'components/resgiter_button.dart';
import 'login_view.dart';

class RegisterView extends GetView<LoginController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Get.put(AuthController());
    return Scaffold(
      backgroundColor: priColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 64),
              child: Image.asset(
                "assets/images/Saly-36.png",
                fit: BoxFit.cover,
                width: Get.width,
                height: Get.height * .4,
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
                          // TEXTFIELD CONFIRM PASSWORD
                          GetBuilder<LoginController>(
                            builder: (c) {
                              return CustomTextField(
                                hintText: "Confirm Password",
                                icon: Icons.lock_outline_rounded,
                                controller:
                                    controller.confirmPasswordController,
                                isObsecure: c.isHide,
                                isNumType: true,
                                isCanHide: true,
                                tapToHide: () => c.hide(),
                              );
                            },
                          ),
                          // BUTTON LOGIN
                          LoginButton(
                            width: 240,
                            tittle: 'REGISTER',
                            onTap: () => auth.loginEmploye(
                                controller.emailController.text,
                                controller.passwordController.text),
                          ),
                          SizedBox(height: 24),

                          // REGISTER
                          RegisterTextButton(
                            askText: "Already have an acoount?",
                            actionText: "Login!",
                            onTap: () => Get.to(() => LoginView()),
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
    );
  }
}
