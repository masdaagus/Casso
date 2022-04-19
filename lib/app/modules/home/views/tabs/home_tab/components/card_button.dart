import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    Key? key,
    this.tittle,
    this.icon,
    this.onTap,
  }) : super(key: key);

  final String? tittle;
  final Widget? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: lightColor,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                color: hitam.withOpacity(.40),
                offset: Offset(3, 3),
              ),
              BoxShadow(
                blurRadius: 6,
                color: orange.withOpacity(.10),
                offset: Offset(-4, -4),
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 8),
            Container(
              height: 40,
              width: 40,
              child: icon,
              constraints: BoxConstraints(maxHeight: 40, maxWidth: 40),
            ),
            SizedBox(height: 8),
            Text(
              tittle!,
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Ubuntu",
                color: darkColor,
                letterSpacing: .5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
