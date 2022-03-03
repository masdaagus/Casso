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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      // height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: putih.withOpacity(.3),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            decoration: BoxDecoration(
                color: darkColor,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: hitam.withOpacity(.3),
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TABLE ${table} - (${guessName})",
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
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        child: Text(
                          controller.items[index],
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: putih,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              letterSpacing: .5),
                        ),
                      ),
                      Text(
                        "Rp${price[index]}",
                        style: TextStyle(
                            color: putih,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            letterSpacing: .5),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 2,
            color: darkColor,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TOTAL",
                  style: TextStyle(
                      color: putih,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: .3),
                ),
                Text(
                  "Rp.150.000",
                  style: TextStyle(
                      color: putih,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: .3),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
