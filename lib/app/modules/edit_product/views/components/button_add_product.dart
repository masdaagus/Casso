import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class ButtonAddProduct extends StatelessWidget {
  const ButtonAddProduct({
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
        padding: const EdgeInsets.only(top: 2),
        height: 40,
        width: 184,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: lightColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              color: Colors.black.withOpacity(.35),
              offset: Offset(4, 4),
            ),
            BoxShadow(
              blurRadius: 8,
              color: orange.withOpacity(.10),
              offset: Offset(-4, -4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "SUBMIT",
            style: TextStyle(
              color: darkColor,
              fontFamily: "Ubuntu",
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
