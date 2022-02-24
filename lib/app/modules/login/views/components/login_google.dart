import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginGoogleButton extends StatelessWidget {
  const LoginGoogleButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(top: 32, bottom: 12),
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
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
              child: Container(
                margin: const EdgeInsets.only(left: 3, top: 2),
                color: textColor.withOpacity(.02),
                child: SvgPicture.asset(
                  "assets/svg/google.svg",
                  color: Color(0XFFE19D0A).withOpacity(.85),
                  height: 24,
                ),
              ),
            ),
          ),
        ),
        Text(
          "Login with Google",
          style: TextStyle(
            color: iconColor,
            fontFamily: "balsamiq",
            fontSize: 12,
            letterSpacing: .5,
          ),
        ),
      ],
    );
  }
}
