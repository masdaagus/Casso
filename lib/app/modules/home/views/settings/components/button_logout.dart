import 'package:flutter/material.dart';

import '../../../../../utils/constant.dart';

class ButtonLogout extends StatelessWidget {
  const ButtonLogout({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          border: Border.all(color: putih),
          color: darkColor,
        ),
        child: Center(
          child: Text(
            "LOG OUT",
            style: TextStyle(
              color: lightColor,
              fontFamily: "Ubuntu",
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
