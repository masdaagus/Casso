import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/account_info.dart';

class ProfileTab extends GetView<HomeController> {
  final auth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 48),
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
              ),
              // child: SvgPicture.asset(
              //   "assets/svg/avatar-2.svg",
              //   fit: BoxFit.fitWidth,
              //   width: 150,
              // ),

              child: Image.asset("assets/images/avatar-2.png"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 38, bottom: 16),
            // height: 300,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              color: putih.withOpacity(.05),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                AccountInfo(
                  tittle: "Name",
                  value: controller.user.name,
                  icon: Icons.person,
                ),
                AccountInfo(
                  tittle: "Email",
                  value: controller.user.email,
                  icon: Icons.mail,
                ),
                AccountInfo(
                  tittle: "Password",
                  value: controller.user.password,
                  icon: Icons.lock,
                  isCanHide: true,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => auth.logout(),
            child: Container(
              margin: const EdgeInsets.only(top: 32),
              height: 50,
              width: 184,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: darkColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black.withOpacity(.35),
                    offset: Offset(4, 4),
                  ),
                  BoxShadow(
                    blurRadius: 8,
                    color: iconColor.withOpacity(.30),
                    offset: Offset(-4, -4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Log out",
                  style: TextStyle(
                    color: lightColor,
                    fontFamily: "balsamiq",
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
