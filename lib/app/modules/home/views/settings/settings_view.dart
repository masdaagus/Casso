import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:casso/app/modules/home/views/settings/components/card_info.dart';
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
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 24),
            height: 160,
            width: double.infinity,
            color: darkColor,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "PENGATURAN",
                style: TextStyle(
                  color: lightColor,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          CardInfoResto(
            ownerName: ctrl.resto.value.ownerName,
            restoLocation: ctrl.resto.value.restoLocation,
            restoName: ctrl.resto.value.restoName,
            onTap: () {
              if (ctrl.user.value.status == 'OWNER') {
                Get.to(
                  () => RestoView(),
                  binding: RestoBinding(),
                  duration: Duration(milliseconds: 300),
                  transition: Transition.fadeIn,
                );
              } else {
                Get.snackbar(
                  ctrl.user.value.status!,
                  "Hanya owner cafe yang bisa merubah profile resto",
                  backgroundColor: lightColor,
                );
              }
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 270),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PackageSettings(),
                  PackageHelpAndInformation(),
                  SizedBox(height: 72),
                  ButtonLogout(onTap: () {
                    ctrl.auth.logout();
                  }),
                  SizedBox(height: 72),
                ],
              ),
            ),
          ),
          GetBuilder<HomeController>(builder: (c) {
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
    );
  }
}
