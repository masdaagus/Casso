import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonOrder extends StatelessWidget {
  const ButtonOrder({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 32),
        height: 50,
        width: 184,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: darkColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black.withOpacity(.35),
              offset: Offset(4, 4),
            ),
            BoxShadow(
              blurRadius: 8,
              color: iconColor.withOpacity(.30),
              offset: Offset(-4, -4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "ORDER",
            style: TextStyle(
              color: lightColor,
              fontFamily: "balsamiq",
              fontWeight: FontWeight.w800,
              letterSpacing: 1,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
