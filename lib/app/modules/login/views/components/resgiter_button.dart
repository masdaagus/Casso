import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class RegisterTextButton extends StatelessWidget {
  const RegisterTextButton({
    Key? key,
    this.onTap,
    this.askText = "Don't have an account",
    this.actionText = "Register!",
  }) : super(key: key);

  final VoidCallback? onTap;
  final String askText;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            askText,
            style: TextStyle(
              color: abu,
              fontFamily: "Ubuntu",
              fontSize: 12,
              letterSpacing: .5,
            ),
          ),
          SizedBox(width: 4),
          GestureDetector(
            onTap: onTap,
            child: Text(
              actionText,
              style: TextStyle(
                color: Color(0XFFE19D0A),
                fontFamily: "Ubuntu",
                fontSize: 12,
                letterSpacing: .5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
