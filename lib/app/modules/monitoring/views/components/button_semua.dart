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
        margin: const EdgeInsets.only(top: 4, bottom: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: 164,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                offset: Offset(3, 3),
                blurRadius: 6,
                color: hitam.withOpacity(.35),
              ),
              BoxShadow(
                offset: Offset(-3, -3),
                blurRadius: 6,
                color: lightColor.withOpacity(.2),
              ),
            ],
            gradient: LinearGradient(colors: grColor2)),
        child: Center(
          child: Text(
            tittleButton.toUpperCase(),
            style: TextStyle(
              color: darkColor,
              fontFamily: "balsamiq",
              fontWeight: FontWeight.bold,
              // letterSpacing: .5,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
