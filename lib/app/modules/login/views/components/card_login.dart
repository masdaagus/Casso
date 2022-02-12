import 'dart:ui';

import 'package:casso/app/data/constant.dart';
import 'package:casso/app/modules/components/login_and_register/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CardLogin extends StatelessWidget {
  const CardLogin({
    Key? key,
    this.login,
    this.loginWithGoogle,
  }) : super(key: key);

  final VoidCallback? login;
  final VoidCallback? loginWithGoogle;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        children: [
          // gradient
          Center(
            child: Container(
              height: 43,
              width: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [biru, orange, ungu],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0, 0.5, 1],
                ),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 42,
              sigmaY: 42,
            ),

            // widget sign in
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(.25),
                    Colors.white.withOpacity(.15)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: Colors.white.withOpacity(.3),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 46),
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(
                        letterSpacing: .5,
                        fontSize: 32,
                        color: textColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      CustomTextField(
                        hint: "Email",
                        icon: Icons.person_outlined,
                      ),
                      CustomTextField(
                        hint: "Password",
                        icon: Icons.lock_outlined,
                        obscure: true,
                      ),
                      SizedBox(height: padding),
                      ElevatedButton(
                        onPressed: login,
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          primary: primaryColor,
                          minimumSize: Size(Get.width, 43),
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: padding * 2),
                        child: ElevatedButton(
                          onPressed: loginWithGoogle,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 4),
                                child: SvgPicture.asset(
                                  "assets/svg/google.svg",
                                  height: 24,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Login with Google",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 12,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            primary: putih.withOpacity(.2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
