import 'package:flutter/material.dart';

import '../../../../utils/constant.dart';

class CardAndReceipt extends StatelessWidget {
  const CardAndReceipt({
    Key? key,
    required this.total,
    required this.receiipt,
  }) : super(key: key);

  final String total;
  final String receiipt;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.payment),
                  const SizedBox(width: 8),
                  const Text(
                    "Card",
                    style: TextStyle(color: darkColor, fontSize: 16),
                  ),
                ],
              ),
              Text(
                total,
                style: TextStyle(color: textDark, fontSize: 16),
              )
            ],
          ),
          Divider(color: darkColor.withOpacity(.5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.receipt_long_outlined),
                  const SizedBox(width: 8),
                  const Text(
                    "Receipt",
                    style: TextStyle(color: darkColor, fontSize: 16),
                  ),
                ],
              ),
              Text(
                "#$receiipt",
                style:
                    TextStyle(color: darkColor.withOpacity(.6), fontSize: 16),
              ),
            ],
          ),
          Divider(color: darkColor.withOpacity(.5)),
        ],
      ),
    );
  }
}
