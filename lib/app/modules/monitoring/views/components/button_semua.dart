import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonAll extends StatelessWidget {
  const ButtonAll({
    Key? key,
    required this.tittleButton,
    required this.onTap,
  }) : super(key: key);

  final String tittleButton;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 8,
              color: hitam.withOpacity(.3),
            ),
            BoxShadow(
              offset: Offset(-4, -4),
              blurRadius: 8,
              color: lightColor.withOpacity(.2),
            ),
          ],
          color: darkColor,
        ),
        child: Center(
          child: Text(
            tittleButton.toUpperCase(),
            style: TextStyle(
              color: textColor.withOpacity(.9),
              fontFamily: "balsamiq",
              fontWeight: FontWeight.bold,
              letterSpacing: .5,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
