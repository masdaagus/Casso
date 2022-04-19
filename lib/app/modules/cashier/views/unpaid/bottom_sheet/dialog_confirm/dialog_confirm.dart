import 'dart:ui';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'choco_button.dart';

class DialogConfirm extends StatelessWidget {
  const DialogConfirm({
    Key? key,
    this.guessName,
    this.onTap,
  }) : super(key: key);

  final String? guessName;
  final VoidCallback? onTap;

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
            color: putih.withOpacity(.45),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(height: 32),
              Container(
                height: 128,
                child: Image.asset("assets/images/list-order.png"),
              ),
              SizedBox(height: 8),
              Text(
                "Confirmation",
                style: TextStyle(
                  color: lightColor,
                  fontFamily: 'Ubuntu',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Apakah data order yang di pesan\nsudah sesuai ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkColor,
                  fontFamily: 'Ubuntu',
                  fontSize: 16,
                  letterSpacing: .5,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChocoButton(
                    tittle: 'No  ',
                    color: merah.withOpacity(.4),
                    icon: Icons.cancel_outlined,
                    onTap: () => Get.back(),
                  ),
                  ChocoButton(
                      tittle: 'Yes ',
                      color: biru,
                      icon: Icons.check,
                      onTap: onTap
                      //  () {
                      // Get.offAllNamed('/home');
                      // Get.defaultDialog(
                      //     backgroundColor: Colors.transparent,
                      //     barrierDismissible: false,
                      //     title: '',
                      //     content: DialogCashier(),
                      //     onWillPop: () async {
                      //       return false;
                      //     });
                      // },
                      ),
                ],
              ),
              SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}
