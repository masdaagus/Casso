import 'dart:developer';

import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:casso/app/modules/home/controllers/keypad_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constant.dart';
import 'components/keypads_buttons.dart';

class KeypadTab extends GetView<KeypadController> {
  const KeypadTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(KeypadController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: putih.withOpacity(1),
            child: Center(
                child: Obx(() => Text(
                      "RM ${controller.calculatorString}",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: darkColor.withOpacity(.8),
                      ),
                    ))),
          ),
        ),
        CalculatorButtons(
          onTap: controller.onPressed,
        ),

        // TextButton(
        //   onPressed: () async {
        //     final x = Get.put(HomeController());
        //     await x.insertProducts();
        //   },
        //   child: Text("INSERT"),
        // ),
      ],
    );
  }
}
