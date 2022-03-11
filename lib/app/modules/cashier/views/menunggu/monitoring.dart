import 'dart:ui';

import 'package:casso/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/prices_card.dart';
import 'components/search_box.dart';

class Menunggu extends GetView<CashierController> {
  const Menunggu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: Column(
        children: [
          // card seraching
          SearchBox(),

          // List items dan total
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return PricesCard(
                  guessName: controller.names[index],
                  table: controller.table[index],
                  price: controller.prices,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
