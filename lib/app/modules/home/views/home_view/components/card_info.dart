import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    Key? key,
    this.restoName,
    this.restoLocation,
    this.userName,
    this.userStatus,
  }) : super(key: key);

  final String? restoName;
  final String? restoLocation;
  final String? userName;
  final String? userStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 12, top: 16),
          child: Text(
            restoName ?? '',
            style: TextStyle(
              color: darkColor,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 8),
          child: Text(
            restoLocation ?? '',
            style: TextStyle(
              color: darkColor,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 46),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Text(
                userName ?? '',
                style: TextStyle(
                  color: darkColor,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 4),
              Text(
                "(${userStatus ?? ''})",
                style: TextStyle(
                  color: orange,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
