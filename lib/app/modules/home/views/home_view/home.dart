import 'package:casso/app/modules/cashier/views/cashier_view.dart';
import 'package:casso/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:casso/app/modules/dashboard/views/dashboard_view.dart';
import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:casso/app/modules/monitoring/bindings/monitoring_binding.dart';
import 'package:casso/app/modules/order/bindings/order_binding.dart';
import 'package:casso/app/modules/order/views/order_view.dart';
import 'package:casso/app/modules/pegawai/bindings/pegawai_binding.dart';
import 'package:casso/app/modules/pegawai/views/pegawai_view.dart';
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
          height: 240,
          color: darkColor,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            "CASSO",
            style: TextStyle(
              color: lightColor,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
              fontSize: 28,
              letterSpacing: -.5,
            ),
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(left: 16, right: 16, top: 190, bottom: 32),
          width: double.infinity,
          height: 190,
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
          ),
        ),
        Positioned(
          right: -16,
          top: 90,
          child: Container(
            height: 180,
            width: 180,
            child: Image.asset("assets/images/robo.png"),
          ),
        ),
        Positioned(
          right: 32,
          top: 330,
          child: Transform.rotate(
            angle: -math.pi / 8,
            child: Container(
              height: 100,
              width: 100,
              child: Image.asset("assets/images/credit-card.png"),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 450),
          // padding: const EdgeInsets.symmetric(horizontal: 32),
          // color: orange.withOpacity(.2),
          child: GridView.count(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            physics: BouncingScrollPhysics(),
            crossAxisSpacing: 24,
            // childAspectRatio: 1.1,
            crossAxisCount: 3,
            mainAxisSpacing: 24,
            children: [
              ButtonCard(
                icon: Icons.computer,
                tittle: 'MONITOR',
                onTap: () => Get.to(
                  () => MonitoringView(),
                  duration: Duration(milliseconds: 480),
                  binding: MonitoringBinding(),
                ),
              ),
              ButtonCard(
                icon: Icons.assignment_outlined,
                tittle: 'LIST ORDER',
                onTap: () => Get.to(
                  () => CashierView(),
                  duration: Duration(milliseconds: 500),
                  binding: CashierBinding(),
                ),
              ),
              ButtonCard(
                icon: Icons.add_shopping_cart,
                tittle: 'ORDER',
                onTap: () => Get.to(
                  () => OrderView(),
                  duration: Duration(milliseconds: 500),
                  binding: OrderBinding(),
                ),
              ),
              ButtonCard(
                icon: Icons.desktop_windows_outlined,
                tittle: 'DASHBOARD',
                onTap: () => Get.to(
                  () => DashboardView(),
                  duration: Duration(milliseconds: 480),
                  binding: DashboardBinding(),
                ),
              ),
              ButtonCard(
                icon: Icons.group_outlined,
                tittle: 'PEGAWAI',
                onTap: () => Get.to(
                  () => PegawaiView(),
                  duration: Duration(milliseconds: 480),
                  binding: PegawaiBinding(),
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
                  duration: Duration(milliseconds: 480),
                  binding: ProductBinding(),
                ),
              ),
              // Container(
              //   color: merah,
              // ),
            ],
          ),
        )
      ],
    );
  }
}