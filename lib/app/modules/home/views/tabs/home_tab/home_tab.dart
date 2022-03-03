import 'dart:ui';

import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

import 'components/card_button.dart';

class TabHome extends GetView<HomeController> {
  const TabHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 32,
            left: 32,
            child: Text(
              "Casso",
              style: TextStyle(
                color: orange,
                fontFamily: "balsamiq",
                fontSize: 36,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Positioned(
              top: 32,
              right: 18,
              child: Image.asset(
                "assets/images/list-order.png",
                width: Get.width * .32,
              )),
          Positioned(
              top: 132,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 55,
                    sigmaY: 55,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    width: Get.width,
                    height: 240,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        darkColor.withOpacity(.15),
                        iconColor.withOpacity(.15),
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selamat Datang",
                          style: TextStyle(
                            color: lightColor,
                            fontFamily: "balsamiq",
                            fontWeight: FontWeight.w800,
                            letterSpacing: 2,
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          "di Noriz Caffe",
                          style: TextStyle(
                              color: lightColor,
                              fontFamily: "balsamiq",
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              letterSpacing: 1),
                        ),
                        SizedBox(height: 48),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Masda Agus",
                              style: TextStyle(
                                  color: orange,
                                  fontFamily: "balsamiq",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  letterSpacing: 1),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "(CASHIER)",
                              style: TextStyle(
                                  color: iconColor,
                                  fontFamily: "balsamiq",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          Positioned(
              right: 16,
              top: 285,
              child: Transform.rotate(
                angle: -math.pi / 7,
                child: Image.asset(
                  "assets/images/credit-card.png",
                  width: Get.width * .38,
                ),
              )),
          Positioned(
            top: 440,
            child: Container(
              height: 300,
              width: Get.width,
              // color: putih.withOpacity(.05),
              child: GridView.count(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                physics: BouncingScrollPhysics(),
                crossAxisSpacing: 24,
                childAspectRatio: 1.1,
                crossAxisCount: 3,
                mainAxisSpacing: 24,
                children: [
                  CardButton(
                    icon: Icon(
                      Icons.desktop_mac_outlined,
                      size: 40,
                      color: iconColor,
                    ),
                    tittle: "Monitoring",
                    onTap: () => Get.toNamed("/monitoring"),
                  ),
                  CardButton(
                    icon: Icon(
                      Icons.assignment,
                      size: 40,
                      color: iconColor,
                    ),
                    tittle: "List Order",
                    onTap: () => Get.toNamed("/cashier"),
                  ),
                  CardButton(
                    icon: Icon(
                      Icons.add_shopping_cart,
                      size: 40,
                      color: iconColor,
                    ),
                    tittle: "Order",
                    onTap: () => Get.toNamed("/order"),
                  ),
                  CardButton(
                    icon: Icon(
                      Icons.desktop_windows_outlined,
                      size: 40,
                      color: iconColor,
                    ),
                    tittle: "Dashboard",
                    onTap: () => Get.toNamed("/monitoring"),
                  ),
                  CardButton(
                    icon: Icon(
                      Icons.group_rounded,
                      size: 40,
                      color: iconColor,
                    ),
                    tittle: "Pegawai",
                    onTap: () => Get.toNamed("/cashier"),
                  ),
                  CardButton(
                    icon: SvgPicture.asset(
                      "assets/svg/burger.svg",
                      width: 40,
                      color: iconColor,
                    ),
                    tittle: "Product",
                    onTap: () => Get.toNamed("/product"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
