import 'dart:ui';

import 'package:casso/app/modules/cashier/bindings/cashier_binding.dart';
import 'package:casso/app/modules/cashier/views/cashier_view.dart';
import 'package:casso/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:casso/app/modules/dashboard/views/dashboard_view.dart';
import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:casso/app/modules/monitoring/bindings/monitoring_binding.dart';
import 'package:casso/app/modules/monitoring/views/monitoring_view.dart';
import 'package:casso/app/modules/order/bindings/order_binding.dart';
import 'package:casso/app/modules/order/views/order_view.dart';
import 'package:casso/app/modules/product/bindings/product_binding.dart';
import 'package:casso/app/modules/product/views/product_view.dart';
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
                fontFamily: "Ubuntu",
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
                        abu.withOpacity(.15),
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selamat Datang",
                          style: TextStyle(
                            color: darkColor,
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.w800,
                            letterSpacing: 2,
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          "di ${controller.resto.value.restoName}",
                          style: TextStyle(
                              color: darkColor,
                              fontFamily: "Ubuntu",
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              letterSpacing: 1),
                        ),
                        SizedBox(height: 48),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              controller.user.value.name!,
                              style: TextStyle(
                                  color: orange,
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  letterSpacing: 1),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "(${controller.user.value.status})",
                              style: TextStyle(
                                  color: abu,
                                  fontFamily: "Ubuntu",
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
              height: 400,
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
                      color: darkColor,
                    ),
                    tittle: "Monitoring",
                    onTap: () => Get.to(
                      () => MonitoringView(),
                      duration: Duration(milliseconds: 480),
                      binding: MonitoringBinding(),
                    ),
                  ),
                  CardButton(
                    icon: Icon(
                      Icons.assignment,
                      size: 40,
                      color: darkColor,
                    ),
                    tittle: "List Order",
                    // onTap: () => Get.toNamed("/cashier"),
                    onTap: () => Get.to(
                      () => CashierView(),
                      duration: Duration(milliseconds: 500),
                      binding: CashierBinding(),
                    ),
                  ),
                  CardButton(
                    icon: Icon(
                      Icons.add_shopping_cart,
                      size: 40,
                      color: darkColor,
                    ),
                    tittle: "Order",
                    // onTap: () => Get.toNamed("/order"),
                    onTap: () => Get.to(
                      () => OrderView(),
                      duration: Duration(milliseconds: 500),
                      binding: OrderBinding(),
                    ),
                  ),
                  CardButton(
                    icon: Icon(
                      Icons.desktop_windows_outlined,
                      size: 40,
                      color: darkColor,
                    ),
                    tittle: "Dashboard",
                    onTap: () => Get.to(
                      () => DashboardView(),
                      duration: Duration(milliseconds: 480),
                      binding: DashboardBinding(),
                    ),
                  ),
                  CardButton(
                    icon: Icon(
                      Icons.group_rounded,
                      size: 40,
                      color: darkColor,
                    ),
                    tittle: "Pegawai",
                    onTap: () => Get.toNamed("/pegawai"),
                  ),
                  CardButton(
                    icon: SvgPicture.asset(
                      "assets/svg/burger.svg",
                      width: 40,
                      color: darkColor,
                    ),
                    tittle: "Product",
                    onTap: () => Get.to(
                      () => ProductView(),
                      duration: Duration(milliseconds: 480),
                      binding: ProductBinding(),
                    ),
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
