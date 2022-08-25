import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:casso/app/modules/home/views/settings/components/card_info.dart';
import 'package:casso/app/modules/login/bindings/login_binding.dart';
import 'package:casso/app/modules/login/views/login_view.dart';
import 'package:casso/app/modules/resto/bindings/resto_binding.dart';
import 'package:casso/app/modules/resto/views/resto_view.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:casso/app/utils/spinner_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/button_logout.dart';
import 'components/help_and_info_package.dart';
import 'components/settings_package.dart';

class SettingsView extends GetView<HomeController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HomeController>();
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 56,
            width: double.infinity,
            color: putih,
            child: Center(
              child: Text(
                "PENGATURAN",
                style: TextStyle(
                  color: darkColor,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            // margin: const EdgeInsets.only(top: 56),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PackageSettings(),
                  PackageHelpAndInformation(),
                  SizedBox(height: 72),
                  ButtonLogout(onTap: () {
                    ctrl.auth.logout().then(
                          (value) => Get.offAll(
                            LoginView(),
                            binding: LoginBinding(),
                          ),
                        );
                  }),
                  SizedBox(height: 72),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
