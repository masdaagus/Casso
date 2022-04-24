import 'package:flutter/material.dart';

import '../../../../../utils/constant.dart';

class CardInfoResto extends StatelessWidget {
  const CardInfoResto({
    Key? key,
    this.restoName,
    this.restoLocation,
    this.ownerName,
    this.onTap,
  }) : super(key: key);

  final String? restoName;
  final String? restoLocation;
  final String? ownerName;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, top: 80),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: putih,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: hitam.withOpacity(.25),
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.ramen_dining,
                size: 48,
                color: biru,
              ),
              SizedBox(height: 8),
              Text(
                restoName ?? '',
                style: TextStyle(
                  color: darkColor,
                  fontFamily: 'Ubuntu',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "${ownerName} (OWNER)",
                style: TextStyle(
                  color: darkColor,
                  fontFamily: 'Ubuntu',
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 2),
              Text(
                restoLocation ?? '',
                style: TextStyle(
                  color: darkColor,
                  fontFamily: 'Ubuntu',
                  fontSize: 12,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: darkColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Text(
                    "Ubah Profile",
                    style: TextStyle(
                      color: lightColor,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.settings, color: lightColor, size: 14),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
