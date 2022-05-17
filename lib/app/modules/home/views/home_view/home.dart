import 'package:casso/app/modules/cashier/views/cashier_view.dart';
import 'package:casso/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:casso/app/modules/dashboard/views/dashboard_view.dart';
import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:casso/app/modules/monitoring/bindings/monitoring_binding.dart';
import 'package:casso/app/modules/order/bindings/order_binding.dart';
import 'package:casso/app/modules/order/views/order_view.dart';
import 'package:casso/app/modules/employe/bindings/pegawai_binding.dart';
import 'package:casso/app/modules/employe/views/pegawai_view.dart';
import 'package:casso/app/modules/product/bindings/product_binding.dart';
import 'package:casso/app/modules/product/views/product_view.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../../cashier/bindings/cashier_binding.dart';
import '../../../monitoring/views/monitoring_view.dart';
import 'components/button.dart';
import 'components/card_info.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Stack(
      children: [
        Container(
          height: 220,
          color: darkColor,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 16, top: 62),
            child: Text(
              "CASSO",
              style: TextStyle(
                color: lightColor,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
                fontSize: 32,
                letterSpacing: -.5,
              ),
            ),
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(left: 16, right: 16, top: 120, bottom: 52),
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            color: putih,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: hitam.withOpacity(.25),
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: CardInfo(
            restoName: controller.resto.value.restoName,
            restoLocation: controller.resto.value.restoLocation,
            userName: controller.user.value.name,
            userStatus: controller.user.value.status,
            expAt: controller.resto.value.expiredAt,
          ),
        ),
        Positioned(
          right: -16,
          top: 20,
          child: Container(
            height: 180,
            width: 180,
            child: Image.asset("assets/images/robo.png"),
          ),
        ),
        Positioned(
          right: 32,
          top: 250,
          child: Transform.rotate(
            angle: -math.pi / 7,
            child: Container(
              height: 100,
              width: 100,
              child: Image.asset("assets/images/credit-card.png"),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 330),
            // padding: const EdgeInsets.symmetric(horizontal: 32),
            // color: orange.withOpacity(.2),
            child: GridView.count(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              physics: BouncingScrollPhysics(),
              crossAxisSpacing: 16,
              childAspectRatio: .8,
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              children: [
                ButtonCard(
                  icon: Icons.computer,
                  tittle: 'MONITOR',
                  onTap: () => Get.to(
                    () => MonitoringView(),
                    duration: Duration(milliseconds: 280),
                    binding: MonitoringBinding(),
                    transition: Transition.fadeIn,
                  ),
                ),
                ButtonCard(
                  icon: Icons.assignment_outlined,
                  tittle: 'LIST ORDER',
                  onTap: () => Get.to(
                    () => CashierView(),
                    duration: Duration(milliseconds: 280),
                    binding: CashierBinding(),
                    transition: Transition.fadeIn,
                  ),
                ),
                ButtonCard(
                  icon: Icons.add_shopping_cart,
                  tittle: 'ORDER',
                  onTap: () {
                    String date = controller.resto.value.expiredAt!;
                    DateTime expDate = DateTime.parse(date);

                    if (controller.now.isBefore(expDate)) {
                      Get.to(
                        () => OrderView(),
                        duration: Duration(milliseconds: 280),
                        binding: OrderBinding(),
                        transition: Transition.fadeIn,
                      );
                    } else {
                      Get.defaultDialog();
                    }
                  },
                ),
                ButtonCard(
                  icon: Icons.desktop_windows_outlined,
                  tittle: 'DASHBOARD',
                  onTap: () => Get.to(
                    () => DashboardView(),
                    duration: Duration(milliseconds: 280),
                    binding: DashboardBinding(),
                    transition: Transition.fadeIn,
                  ),
                ),
                ButtonCard(
                  icon: Icons.group_outlined,
                  tittle: 'PEGAWAI',
                  onTap: () => Get.to(
                    () => EmployeView(),
                    duration: Duration(milliseconds: 280),
                    binding: PegawaiBinding(),
                    transition: Transition.fadeIn,
                  ),
                ),
                ButtonCard(
                  noIcon: SvgPicture.asset(
                    "assets/svg/burger.svg",
                    color: darkColor.withOpacity(.8),
                    width: 38,
                  ),
                  tittle: 'PRODUK',
                  onTap: () => Get.to(
                    () => ProductView(),
                    duration: Duration(milliseconds: 280),
                    binding: ProductBinding(),
                    transition: Transition.fadeIn,
                  ),
                ),
                // Container(
                //   color: merah,
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
