import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../utils/constant.dart';

class ItemTransaction extends StatelessWidget {
  const ItemTransaction({
    Key? key,
    required this.img,
    required this.itemName,
    required this.price,
  }) : super(key: key);
  final String itemName;
  final String? img;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            (img != null)
                ? Container(
                    height: 48,
                    width: 48,
                    child: Image.memory(
                      base64Decode('$img'),
                      fit: BoxFit.cover,
                    ),
                  )
                : Container(
                    color: lightColor,
                    height: 48,
                    width: 48,
                    child: Center(
                      child: Text(
                        itemName[0].toUpperCase(),
                        style: TextStyle(
                          color: darkColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
            SizedBox(width: 8),
            Text(
              '$itemName',
              style: TextStyle(
                color: darkColor.withOpacity(.8),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Text(
          'RM $price',
          style: TextStyle(
            color: darkColor.withOpacity(.8),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
