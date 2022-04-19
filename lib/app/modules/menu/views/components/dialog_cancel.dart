import 'dart:ui';
import 'package:casso/app/modules/order/controllers/order_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogCancel extends GetView<OrderController> {
  DialogCancel({
    Key? key,
    this.onConfirm,
  }) : super(key: key);

  final VoidCallback? onConfirm;

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
                "Anda yakin akan keluar ?\nsemua order yang sudah dipesan akan terhapus",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: lightColor,
                  fontFamily: 'Ubuntu',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
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
                  DialogButton(onTap: onConfirm),
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
            fontFamily: "Ubuntu",
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
