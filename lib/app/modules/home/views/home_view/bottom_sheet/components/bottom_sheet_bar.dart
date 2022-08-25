import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetBar extends StatelessWidget {
  BottomSheetBar({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: textDark.withOpacity(.2),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Center(
              child: Text(
                "x",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Container(
            child: Obx(
              () => Text(
                "Current Sale(${controller.productsOrder.toSet().length})",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => controller.clearListOrder(),
            child: Container(
              height: 32,
              width: 32,
              child: Center(child: Icon(Icons.delete_outline)),
            ),
          ),
        ],
      ),
    );
  }
}
