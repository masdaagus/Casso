import 'dart:ui';

import 'package:casso/app/data/constant.dart';
import 'package:casso/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/prices_card.dart';
import 'components/search_box.dart';

class Monitoring extends GetView<CashierController> {
  const Monitoring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  sigmaX: 45,
                  sigmaY: 45,
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
                  ),
                  child: Column(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
