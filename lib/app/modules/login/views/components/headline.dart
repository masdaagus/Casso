import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  const Headline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 42),
      child: Text(
        "Casso",
        style: TextStyle(
          fontFamily: 'Montserrat',
          color: iconColor,
          fontWeight: FontWeight.w600,
          fontSize: 64,
        ),
      ),
    );
  }
}
