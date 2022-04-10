import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class HaderInfo extends StatelessWidget {
  const HaderInfo({
    Key? key,
    this.guessName,
    this.tableNumber = 0,
    this.waitersName,
  }) : super(key: key);

  final String? guessName;
  final int? tableNumber;
  final String? waitersName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                guessName ?? 'NO-NAME',
                style: TextStyle(
                  color: darkColor,
                  fontFamily: 'balsamiq',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 4),
              Text(
                "(TABLE - $tableNumber)",
                style: TextStyle(
                  color: darkColor,
                  fontFamily: 'balsamiq',
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            waitersName ?? 'NO-WAITERS',
            style: TextStyle(
              color: darkColor,
              fontFamily: 'balsamiq',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
