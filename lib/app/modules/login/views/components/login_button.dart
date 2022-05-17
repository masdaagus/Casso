import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    this.onTap,
    this.tittle = 'LOGIN',
    this.width = 160,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String tittle;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 32),
        height: 50,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: lightColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: hitam.withOpacity(.35),
              offset: Offset(4, 4),
            ),
            BoxShadow(
              blurRadius: 8,
              color: putih.withOpacity(.40),
              offset: Offset(-4, -4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            tittle,
            style: TextStyle(
              color: darkColor,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
