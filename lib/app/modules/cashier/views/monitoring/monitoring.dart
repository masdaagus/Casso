import 'dart:ui';

import 'package:casso/app/data/constant.dart';
import 'package:casso/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/search_box.dart';

class Monitoring extends GetView<CashierController> {
  const Monitoring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List items = [];
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              Container(
                height: Get.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg.jpg"),
                    fit: BoxFit.cover,
                    opacity: .7,
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 25,
                  sigmaY: 25,
                ),
                child: Container(
                  height: Get.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [putih.withOpacity(.15), putih.withOpacity(.10)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    // border: Border.all(color: putih.withOpacity(.2)),
                  ),
                  child: Column(
                    children: [
                      // card seraching
                      SearchBox(),

                      // List items dan total
                      Container(
                        margin: const EdgeInsets.all(8),
                        // height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: putih.withOpacity(.3),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              height: 40,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 4,
                                      color: hitam.withOpacity(.3),
                                    )
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "TABLE 12 - (Masda agus)",
                                    style: TextStyle(
                                      color: putih,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                  Text(
                                    "2 Hours ago",
                                    style: TextStyle(
                                      color: putih,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 16),
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return itemText();
                                },
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              height: 2,
                              color: primaryColor,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  totalText("TOTAL"),
                                  totalText("Rp.150.000"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget totalText(String data) {
    return Text(
      data,
      style: TextStyle(
          color: putih,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.bold,
          fontSize: 16,
          letterSpacing: .3),
    );
  }

  Widget itemText() {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          orderText("Cappucinno"),
          orderText("Rp23.000"),
        ],
      ),
    );
  }

  Text orderText(String data) {
    return Text(
      data,
      style: TextStyle(
          color: putih,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          letterSpacing: .5),
    );
  }
}

class ItemPrices extends StatelessWidget {
  const ItemPrices({
    Key? key,
    required this.prices,
    required this.items,
  }) : super(key: key);

  final String prices;
  final String items;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${items} x3",
            style: TextStyle(color: textColor, fontFamily: "Montserrat"),
          ),
          Text(
            "Rp${prices}",
            style: TextStyle(color: textColor, fontFamily: "Montserrat"),
          ),
        ],
      ),
    );
  }
}
