import 'dart:ui';

import 'package:casso/app/data/constant.dart';
import 'package:casso/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Monitoring extends GetView<CashierController> {
  const Monitoring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16, right: 8, left: 8),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: 45,
            // width: 200,
            decoration: BoxDecoration(
              color: putih.withOpacity(.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cari Nomor meja/Nama Pengunjung ",
                  style: TextStyle(
                    color: textColor,
                    fontFamily: "Montserrat",
                    fontSize: 13,
                  ),
                ),
                SizedBox(width: 16),
                Icon(
                  Icons.search,
                  color: textColor,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    putih.withOpacity(.3),
                    putih.withOpacity(.3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(color: putih.withOpacity(.3)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    // height: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            orange.withOpacity(.5),
                            biru.withOpacity(.5),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: hitam.withOpacity(.2),
                            offset: Offset(4, 4),
                          ),
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "TABLE 12 - (Masda agus)  ",
                              style: TextStyle(
                                color: textColor.withOpacity(.8),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "4 Hours ago",
                          style: TextStyle(
                            color: textColor.withOpacity(.8),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 13, top: 24, right: 13),
                    height: 300,
                    child: ListView.builder(
                      itemCount: controller.items.length,
                      itemBuilder: (context, int index) {
                        return ItemPrices(
                          items: controller.items[index],
                          prices: controller.prices[index],
                        );
                      },
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
