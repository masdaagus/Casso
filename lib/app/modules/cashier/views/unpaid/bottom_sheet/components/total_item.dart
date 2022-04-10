import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class TotalItem extends StatelessWidget {
  const TotalItem({
    Key? key,
    this.tittle = 'TOTAL',
    this.isGrand = false,
    this.total,
  }) : super(key: key);

  final String tittle;
  final double? total;
  final bool isGrand;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tittle,
            style: TextStyle(
              color: darkColor,
              fontFamily: 'balsamiq',
              fontWeight: isGrand ? FontWeight.bold : null,
              fontSize: 20,
              letterSpacing: .5,
            ),
          ),
          Text(
            "${nf.format(total)}",
            style: TextStyle(
              color: darkColor,
              fontFamily: 'balsamiq',
              fontWeight: isGrand ? FontWeight.bold : null,
              fontSize: 20,
              letterSpacing: .2,
            ),
          )
        ],
      ),
    );
  }
}
