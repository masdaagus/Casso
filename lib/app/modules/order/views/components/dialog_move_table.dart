import 'dart:ui';
import 'package:casso/app/modules/order/controllers/order_controller.dart';
import 'package:casso/app/modules/order/views/components/button_order.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button_dialog.dart';

class DialogMoveTable extends GetView<OrderController> {
  DialogMoveTable({
    Key? key,
    required this.tableNumber,
  }) : super(key: key);

  final int tableNumber;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          width: Get.width,
          decoration: BoxDecoration(
            color: putih.withOpacity(.35),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                "TABLE $tableNumber",
                style: TextStyle(
                  color: putih,
                  fontFamily: "balsamiq",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 24),
              ButtonOrderisNotEmpty(
                tittle: 'PINDAH MEJA',
                color: abu,
                icon: Icons.switch_left_outlined,
                size: 24,
              ),
              ButtonOrderisNotEmpty(
                tittle: 'KOSONGKAN MEJA',
                color: orange,
                icon: Icons.clear,
                size: 22,
                onTap: () {
                  controller.emptyTable(tableNumber);
                  Get.back();
                },
              ),
              ButtonOrderisNotEmpty(
                tittle: 'TAMBAH ORDER',
                color: biru,
                icon: Icons.shopping_cart_outlined,
                onTap: () {
                  // controller.getData();

                  controller.updateOrder(tableNumber);
                },
              ),
              Divider(thickness: 1, color: putih.withOpacity(.6)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DialogButton(
                    isConfirm: false,
                    isConfirmText: 'CANCEL',
                    onTap: () => Get.back(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
