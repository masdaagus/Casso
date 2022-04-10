import 'dart:ui';

import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/confirm_button.dart';
import 'components/detail_payment.dart';
import 'components/header_info.dart';
import 'components/order_item.dart';

class BottomSheetCashier extends GetView<CashierController> {
  const BottomSheetCashier({
    Key? key,
    required this.data,
    this.onTap,
  }) : super(key: key);

  final Order data;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 8,
          sigmaY: 8,
        ),
        child: Container(
          height: Get.height * .7,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                putih.withOpacity(.3),
                putih.withOpacity(.5),
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
                margin: const EdgeInsets.only(top: 8, bottom: 0),
                height: 4,
                width: 60,
                decoration: BoxDecoration(
                  color: darkColor.withOpacity(.7),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: Get.height * .50,
                      margin: const EdgeInsets.only(bottom: 24),
                      child: Stack(
                        children: [
                          Positioned(
                            top: Get.height * .2,
                            child: CardDetailPayment(
                              total: data.totalPrices!,
                              taxes: 10,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            height: Get.height * .25,
                            decoration: BoxDecoration(
                              color: putih,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                HaderInfo(
                                  guessName: data.guessName,
                                  tableNumber: data.tableNumber,
                                  waitersName: data.waitersName,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount: data.productsOrder!.length,
                                      itemBuilder: (context, index) {
                                        ProductOrder itemOrder =
                                            data.productsOrder![index];
                                        return OrderItem(
                                          pn: itemOrder.productName,
                                          prc: itemOrder.productPrice,
                                          qty: itemOrder.productQty,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ConfirmButton(onTap: onTap),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
