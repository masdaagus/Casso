import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constant.dart';

class PaymentAndDate extends StatelessWidget {
  const PaymentAndDate({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.height * .1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "OTHER PAYMENT",
            style: TextStyle(
              color: darkColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: TextStyle(
              color: textDark,
              fontWeight: FontWeight.w400,
            ),
          ),
          Divider(
            color: darkColor.withOpacity(.5),
          )
        ],
      ),
    );
  }
}
