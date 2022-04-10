import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/account_info.dart';
import 'components/custom_textfield.dart';

class ProfileTab extends GetView<HomeController> {
  final auth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8, top: 16),
              padding: const EdgeInsets.all(16),
              // height: 145,
              decoration: BoxDecoration(
                color: abu,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.ramen_dining,
                        size: 48,
                        color: darkColor,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Hujrina Coffie",
                        style: TextStyle(
                          color: darkColor,
                          fontFamily: 'balsamiq',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Yanto Arisan (OWNER)",
                        style: TextStyle(
                          color: darkColor,
                          fontFamily: 'balsamiq',
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "JL.Pancing 1 Medan",
                        style: TextStyle(
                          color: darkColor,
                          fontFamily: 'balsamiq',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.settings, color: darkColor)
                ],
              ),
            ),
            SizedBox(height: 48),

            TextFieldHome(
              label: 'Nama Resto',
              isTextTypeNumber: false,
              controller: controller.restoName =
                  TextEditingController(text: controller.resto.value.restoName),
            ),

            TextFieldHome(
              label: 'Alamat Resto',
              isTextTypeNumber: false,
              controller: controller.restoLocation = TextEditingController(
                  text: controller.resto.value.restoLocation),
            ),

            TextFieldHome(
              label: 'Jumlah Table',
              controller: controller.restoTable = TextEditingController(
                  text: controller.resto.value.tables!.length.toString()),
            ),

            TextFieldHome(
              label: 'Pajak %',
              controller: controller.restoTaxes = TextEditingController(
                text: controller.resto.value.restoTaxes!.toStringAsFixed(0),
              ),
            ),

            SizedBox(height: 56),

            ElevatedButton(
              onPressed: () {
                controller.updateResto();
              },
              child: Text('TES'),
            ),
            // Center(
            //   child: Container(
            //     margin: const EdgeInsets.only(top: 48),
            //     height: 160,
            //     width: 160,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(90),
            //     ),
            //     // child: SvgPicture.asset(
            //     //   "assets/svg/avatar-2.svg",
            //     //   fit: BoxFit.fitWidth,
            //     //   width: 150,
            //     // ),

            //     child: Image.asset("assets/images/avatar-2.png"),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(top: 38, bottom: 16),
            //   // height: 300,
            //   width: Get.width,
            //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            //   decoration: BoxDecoration(
            //     color: abu,
            //     borderRadius: BorderRadius.circular(24),
            //   ),
            //   child: Column(
            //     children: [
            //       AccountInfo(
            //         tittle: "Name",
            //         value: controller.user.name,
            //         icon: Icons.person,
            //       ),
            //       AccountInfo(
            //         tittle: "Email",
            //         value: controller.user.email,
            //         icon: Icons.mail,
            //       ),
            //       AccountInfo(
            //         tittle: "Password",
            //         value: controller.user.password,
            //         icon: Icons.lock,
            //         isCanHide: true,
            //       ),
            //     ],
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () => auth.logout(),
            //   child: Container(
            //     margin: const EdgeInsets.only(top: 32),
            //     height: 50,
            //     width: 184,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(25),
            //       color: lightColor,
            //       boxShadow: [
            //         BoxShadow(
            //           blurRadius: 8,
            //           color: Colors.black.withOpacity(.35),
            //           offset: Offset(4, 4),
            //         ),
            //         BoxShadow(
            //           blurRadius: 8,
            //           color: abu.withOpacity(.30),
            //           offset: Offset(-4, -4),
            //         ),
            //       ],
            //     ),
            //     child: Center(
            //       child: Text(
            //         "Log out",
            //         style: TextStyle(
            //           color: darkColor,
            //           fontFamily: "balsamiq",
            //           fontWeight: FontWeight.w800,
            //           letterSpacing: 1,
            //           fontSize: 18,
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
