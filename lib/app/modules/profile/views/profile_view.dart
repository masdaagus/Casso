import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 48),
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
              ),
              child: SvgPicture.asset(
                "assets/svg/avatar-2.svg",
                fit: BoxFit.fitWidth,
                width: 150,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 38),
            height: 240,
            decoration: BoxDecoration(color: putih.withOpacity(.05)),
          )
        ],
      ),
    );
  }
}
