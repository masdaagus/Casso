import 'package:casso/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PricesCard extends GetView<CashierController> {
  const PricesCard({
    Key? key,
    required this.table,
    required this.guessName,
    required this.price,
  }) : super(key: key);

  final int table;
  final String guessName;

  final List<String> price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: lightColor.withOpacity(.1),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 32,
            decoration: BoxDecoration(
              color: darkColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TABLE ${table} - (${guessName})",
                  style: TextStyle(
                    color: textColor,
                    fontFamily: "balsamiq",
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "By: Masda agus",
                  style: TextStyle(
                    color: textColor,
                    fontFamily: "balsamiq",
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    letterSpacing: .5,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Get.width * .5,
                            child: Text(
                              controller.items[index],
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: textColor,
                                  fontFamily: "balsamiq",
                                  letterSpacing: .5),
                            ),
                          ),
                          Text(
                            "Rp${price[index]}",
                            style: TextStyle(
                                color: textColor,
                                fontFamily: "balsamiq",
                                letterSpacing: .5),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: .5,
                        color: lightColor.withOpacity(.1),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: darkColor.withOpacity(.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TOTAL",
                  style: TextStyle(
                    color: putih,
                    fontFamily: "balsamiq",
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    letterSpacing: .5,
                  ),
                ),
                Text(
                  "Rp150.000",
                  style: TextStyle(
                    color: putih,
                    fontFamily: "balsamiq",
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    letterSpacing: .5,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
