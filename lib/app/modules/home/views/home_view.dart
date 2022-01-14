import 'dart:ui';

import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'components/card_terlaris.dart';
import 'components/info_card.dart';

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
            Row(
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
            ),
            CardInfo(),
            Container(
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
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CardTerlaris(),
                  SizedBox(width: padding),
                  CardTerlaris(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
