import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'components/info_card.dart';
import 'components/list_terlaris.dart';
import 'components/neo_button.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        margin: EdgeInsets.only(top: 35),
        padding: EdgeInsets.all(28),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Obx(() => _textHello(controller.user.name!)),
              CardInfo(),
              _textTerlaris(),
              ListTerlaris(),
              _customDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NeoButton(
                    tittle: "kasir",
                    svg: "assets/svg/kasir.svg",
                    onTap: () => Get.toNamed("/cashier"),
                  ),
                  NeoButton(
                    tittle: "order",
                    svg: "assets/svg/menu_book.svg",
                    onTap: () => Get.toNamed("/order"),
                  ),
                  NeoButton(
                    tittle: "monitor",
                    svg: "assets/svg/pegawai.svg",
                    onTap: () => Get.toNamed("/monitoring"),
                  ),
                  NeoButton(
                    tittle: "product",
                    svg: "assets/svg/burger.svg",
                    onTap: () => Get.toNamed("/product"),
                  ),
                ],
              ),
              SizedBox(height: 160),
              Center(
                child: ElevatedButton(
                  onPressed: () => Get.toNamed('/introduction'),
                  child: Text("tes"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _customDivider() {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 24),
      height: 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            biru.withOpacity(.20),
            orange.withOpacity(.20),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

  Widget _textHello(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: 24,
            fontFamily: "Monserrat",
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SvgPicture.asset("assets/svg/roanded.svg")
      ],
    );
  }

  Widget _textTerlaris() {
    return Container(
      margin: EdgeInsets.only(top: padding * 1.5, bottom: padding),
      child: Text(
        "Pesanan Terlaris",
        style: TextStyle(
          color: textColor,
          fontFamily: "Montserrat",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
