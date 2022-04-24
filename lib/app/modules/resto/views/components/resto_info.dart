import 'package:flutter/material.dart';

import '../../../../utils/constant.dart';

class RestoInfo extends StatelessWidget {
  const RestoInfo({
    Key? key,
    this.restoName,
    this.ownerName,
    this.restoLocation,
  }) : super(key: key);

  final String? restoName;
  final String? ownerName;
  final String? restoLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(left: 8, right: 8, top: 16),
      padding: const EdgeInsets.all(16),
      // height: 145,
      decoration: BoxDecoration(
        color: darkColor,
        // borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.ramen_dining,
                size: 48,
                color: lightColor,
              ),
              SizedBox(height: 8),
              Text(
                restoName ?? "",
                style: TextStyle(
                  color: lightColor,
                  fontFamily: 'Ubuntu',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                restoLocation ?? '',
                style: TextStyle(
                  color: lightColor,
                  fontFamily: 'Ubuntu',
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "${ownerName} (OWNER)",
                style: TextStyle(
                  color: lightColor,
                  fontFamily: 'Ubuntu',
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Icon(Icons.settings, color: darkColor)
        ],
      ),
    );
  }
}
