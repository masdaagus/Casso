import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class RegisterTextButton extends StatelessWidget {
  const RegisterTextButton({
    Key? key,
    this.onTap,
    required this.isRegister,
    // this.askText = "Don't have an account",
    // this.actionText = "Register!",
  }) : super(key: key);

  final VoidCallback? onTap;
  final bool isRegister;
  // final String askText;
  // final String actionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isRegister ? 'Already have an account' : "Don't have an account",
            style: TextStyle(
              color: darkColor.withOpacity(.7),
              fontFamily: "Ubuntu",
              fontSize: 12,
            ),
          ),
          SizedBox(width: 4),
          GestureDetector(
            onTap: onTap,
            child: Text(
              isRegister ? "LOGIN" : 'REGISTER',
              style: TextStyle(
                color: Color(0XFFE19D0A),
                fontFamily: "Ubuntu",
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
