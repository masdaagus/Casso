import 'dart:ui';

import 'package:casso/app/controllers/auth_controller.dart';
import 'dart:developer';

import 'package:casso/app/utils/constant.dart';
import 'package:casso/app/utils/spinner_widget.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import 'components/custom_textfield.dart';

import 'components/headline.dart';
import 'components/login_button.dart';
import 'components/login_google.dart';
import 'components/resgiter_button.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final auth = Get.put(AuthController());

  final controller = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    log('UPDATE');
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: lightColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 48),
                  width: Get.width * .8,
                  child: Image.asset(
                    "assets/images/Saly-22.png",
                    fit: BoxFit.cover,
                    width: size.width,
                    height: size.height * .4,
                  ),
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
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      // curve: Curves.fastOutSlowIn,
                      width: Get.width,
                      height: size.height * .65,
                      // height: _isRegister ? size.height : size.height * .65,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            lightColor.withOpacity(.45),
                            lightColor.withOpacity(.35),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              // HEADLINE TEXT CASSO
                              Headline(),

                              // TEXTFIELD EMAIL
                              GetBuilder<LoginController>(
                                builder: (c) {
                                  return CustomTextField(
                                    hintText: 'Email or ID',
                                    icon: Icons.person_outline_outlined,
                                    controller: controller.emailController,
                                    stringValidation: c.emailValidation,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Email or ID tidak boleh kosong';
                                      }
                                    },
                                  );
                                },
                              ),

                              // TEXTFIELD PASSWORD
                              GetBuilder<LoginController>(
                                builder: (c) {
                                  return CustomTextField(
                                    hintText: "Password",
                                    icon: Icons.lock_outline_rounded,
                                    controller: controller.passwordController,
                                    isObsecure: c.isHide,
                                    isPassword: true,
                                    tapToHide: () => c.hide(),
                                    stringValidation: c.passwordValidation,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Password tidak boleh kosong';
                                      }
                                    },
                                  );
                                },
                              ),

                              // BUTTON LOGIN
                              LoginButton(
                                  tittle: 'LOGIN',
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      if (await controller.login()) {
                                        // BERHASIL LOGIN
                                        print('BERHASIL LOGIN');
                                        Get.offAllNamed('/home');
                                      } else {
                                        // GAGAL LOGIN
                                        print('GAGAL LOGIN');
                                      }
                                    }

                                    // auth.loginEmploye(
                                    //     controller.emailController.text,
                                    //     controller.passwordController.text);
                                  }),
                              // BUTTON LOGIN WITH GOOGLE
                              LoginGoogleButton(
                                onTap: () => auth.loginWithGoogle(),
                              ),
                              // REGISTER
                              // RegisterTextButton(
                              //   // onTap: () => Get.to(() => RegisterView()),
                              //   isRegister: false,

                              //   onTap: () {
                              //     // setState(() {});
                              //   },
                              // ),
                              SizedBox(height: 64)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GetBuilder<LoginController>(builder: (c) {
                return c.isLoading
                    ? Center(
                        child: Container(
                          height: Get.height,
                          width: Get.width,
                          color: hitam.withOpacity(.54),
                          child: Center(
                            child: Container(
                              height: 72,
                              width: 72,
                              decoration: BoxDecoration(
                                color: lightColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: CustomSpinner(),
                            ),
                          ),
                        ),
                      )
                    : Container();
              })
            ],
          ),
        ),
      ),
    );
  }
}
