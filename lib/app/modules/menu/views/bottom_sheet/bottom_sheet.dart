// import 'dart:ui';

import 'dart:ui';

import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/button_order.dart';
import 'components/item_card.dart';
// import 'components/card_chart.dart';

class CustomBottomSheet extends GetView<MenuController> {
  const CustomBottomSheet({
    Key? key,
    this.waitersName,
    this.tableNumber,
    this.totalItems,
    this.totalPrices,
    this.guessName,
    this.onTap,
  }) : super(key: key);

  final String? guessName;
  final String? waitersName;
  final int? tableNumber;
  final int? totalItems;
  final double? totalPrices;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final List<ProductOrder> productOrders =
        controller.order.value.productsOrder!;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 24,
          sigmaY: 24,
        ),
        child: Container(
          height: Get.height * .7,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                darkColor.withOpacity(.3),
                darkColor.withOpacity(.5),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 38),
                height: 4,
                width: 60,
                decoration: BoxDecoration(
                  color: lightColor.withOpacity(.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: productOrders.toSet().toList().length,
                      itemBuilder: (context, index) {
                        ProductOrder data =
                            productOrders.toSet().toList()[index];

                        print(data);

                        return ItemCardBottomSheet(data: data);
                      },
                    ),
                    ButtonOrder(onTap: onTap),
                    SizedBox(height: 40)
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
