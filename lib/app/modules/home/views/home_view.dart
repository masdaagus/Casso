import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'components/glass_button.dart';
import 'components/info_card.dart';
import 'components/list_terlaris.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        margin: EdgeInsets.only(top: 35),
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textHello(),
            CardInfo(),
            _textTerlaris(),
            ListTerlaris(),
            _customDivider(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GlassButton(tittle: "KASIR", icon: Icons.computer),
                    GlassButton(tittle: "MENU", icon: Icons.book),
                    GlassButton(
                        tittle: "ORDER", icon: Icons.online_prediction_rounded),
                    GlassButton(tittle: "PEGAWAI", icon: Icons.cast_sharp),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _customDivider() {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 14),
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

  Widget _textHello() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Hi, Masda agus!",
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
