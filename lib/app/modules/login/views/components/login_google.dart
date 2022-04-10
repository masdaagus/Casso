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
              color: lightColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: hitam.withOpacity(.38),
                  offset: Offset(4, 4),
                ),
                BoxShadow(
                  blurRadius: 6,
                  color: putih.withOpacity(1),
                  offset: Offset(-4, -4),
                ),
              ],
            ),
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(left: 4, top: 4),
                child: SvgPicture.asset(
                  "assets/svg/google.svg",
                  color: darkColor.withOpacity(.85),
                  height: 24,
                ),
              ),
            ),
          ),
        ),
        Text(
          "Login with Google",
          style: TextStyle(
            color: darkColor.withOpacity(.5),
            fontFamily: "balsamiq",
            fontSize: 12,
            letterSpacing: .5,
          ),
        ),
      ],
    );
  }
}
