import 'dart:ui';

import 'package:casso/app/modules/order/controllers/order_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDialog extends GetView<OrderController> {
  const GetDialog({Key? key, required this.tableNumber}) : super(key: key);

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
          // height: 180,
          decoration: BoxDecoration(
            color: putih.withOpacity(.35),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                "TABLE ${tableNumber + 1}",
                style: TextStyle(
                  color: putih,
                  fontFamily: "balsamiq",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 16, left: 24, right: 24, bottom: 24),
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: Get.width,
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: controller.guessNameController,
                  style: TextStyle(
                    fontFamily: "balsamiq",
                    color: darkColor,
                    fontSize: 13,
                    letterSpacing: -.5,
                  ),
                  // controller: guessNameController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    isDense: true,
                    hintStyle: TextStyle(
                      fontFamily: "balsamiq",
                      color: darkColor.withOpacity(.7),
                      fontSize: 13,
                      letterSpacing: -.5,
                    ),
                    border: InputBorder.none,
                    hintText: "Masukkan nama pengunjung . . .",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
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
                  DialogButton(
                    onTap: () => Get.offNamed(
                      "/menu",
                      arguments: [
                        tableNumber,
                        controller.guessNameController.text,
                      ],
                    ),
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

class DialogButton extends StatelessWidget {
  const DialogButton({
    Key? key,
    this.isConfirm = true,
    this.isConfirmText = 'CONFIRM',
    this.onTap,
  }) : super(key: key);

  final bool isConfirm;
  final String isConfirmText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          isConfirmText,
          style: TextStyle(
            color: lightColor,
            fontFamily: "balsamiq",
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontSize: 12,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          primary: isConfirm ? hijau.withOpacity(.5) : merah.withOpacity(.5),
        ),
      ),
    );
  }
}
