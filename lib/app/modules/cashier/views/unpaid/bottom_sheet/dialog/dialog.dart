import 'dart:ui';

import 'package:casso/app/modules/cashier/views/unpaid/bottom_sheet/dialog/button_choice.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogCashier extends StatelessWidget {
  const DialogCashier({
    Key? key,
    this.guessName,
  }) : super(key: key);

  final String? guessName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20,
          sigmaY: 20,
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          width: Get.width,
          decoration: BoxDecoration(
            color: putih.withOpacity(.55),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              SizedBox(height: 64),
              ChocoButton(
                tittle: 'PINDAH MEJA',
                color: abu,
                icon: Icons.switch_left_outlined,
                size: 24,
              ),
              SizedBox(height: 8),
              ChocoButton(
                tittle: 'KOSONGKAN MEJA',
                color: orange,
                icon: Icons.clear,
                size: 22,
                onTap: () {
                  Get.back();
                },
              ),
              SizedBox(height: 8),
              ChocoButton(
                tittle: 'BACK TO HOME',
                color: biru,
                icon: Icons.shopping_cart_outlined,
                onTap: () {},
              ),
              SizedBox(height: 64)
            ],
          ),
        ),
      ),
    );
  }
}
