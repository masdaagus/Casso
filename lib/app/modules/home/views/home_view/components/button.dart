import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    Key? key,
    this.tittle,
    this.icon,
    this.onTap,
    this.noIcon,
  }) : super(key: key);

  final String? tittle;
  final IconData? icon;
  final VoidCallback? onTap;
  final Widget? noIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // height: 100,
            // width: 100,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: hitam.withOpacity(.20),
                  offset: Offset(4, 4),
                ),
                BoxShadow(
                  blurRadius: 4,
                  color: putih.withOpacity(.65),
                  offset: Offset(-4, -4),
                ),
              ],
            ),
            child: (icon != null)
                ? Icon(
                    icon,
                    size: 38,
                    color: darkColor.withOpacity(.8),
                  )
                : noIcon,
          ),
          SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  color: hitam.withOpacity(.25),
                  offset: Offset(2, 2),
                ),
                BoxShadow(
                  blurRadius: 2,
                  color: putih.withOpacity(.55),
                  offset: Offset(-2, -2),
                ),
              ],
            ),
            child: Text(
              tittle!,
              style: TextStyle(
                color: darkColor.withOpacity(.8),
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
                letterSpacing: .3,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
