import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
    this.pn,
    this.qty,
    this.prc,
  }) : super(key: key);

  final String? pn;
  final int? qty;
  final double? prc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "$pn",
                    style: TextStyle(
                      color: darkColor,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  SizedBox(width: 16),
                  if (qty! > 1)
                    Text("x$qty",
                        style: TextStyle(
                          color: darkColor,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                        ))
                ],
              ),
              Text(
                "${nf.format(prc! * qty!)}",
                style: TextStyle(
                  color: darkColor,
                  fontFamily: 'Ubuntu',
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
            color: abu,
          )
        ],
      ),
    );
  }
}
