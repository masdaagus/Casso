import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoImageWidget extends StatelessWidget {
  const NoImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .4,
      width: Get.height * .4,
      decoration: BoxDecoration(
        color: abu,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.no_photography_outlined,
            size: 180,
            color: darkColor,
          ),
          SizedBox(height: 8),
          const Text(
            "NO IMAGE",
            style: TextStyle(
              color: darkColor,
              fontFamily: 'Ubuntu',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
