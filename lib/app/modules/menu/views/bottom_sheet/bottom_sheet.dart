// import 'dart:ui';

import 'dart:ui';

import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/item_card.dart';
// import 'components/card_chart.dart';

class CustomBottomSheet extends GetView<MenuController> {
  const CustomBottomSheet({Key? key}) : super(key: key);

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

                        return ItemCardBottomSheet(data: data);
                      },
                    ),
                    Divider(
                      color: lightColor.withOpacity(.5),
                      thickness: 1,
                      indent: 25,
                      endIndent: 25,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(top: 32),
                        height: 50,
                        width: 184,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: darkColor,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              color: Colors.black.withOpacity(.35),
                              offset: Offset(4, 4),
                            ),
                            BoxShadow(
                              blurRadius: 8,
                              color: iconColor.withOpacity(.30),
                              offset: Offset(-4, -4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "ORDER",
                            style: TextStyle(
                              color: lightColor,
                              fontFamily: "balsamiq",
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
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
