import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    Key? key,
    this.tittle,
    this.icon,
    this.onTap,
  }) : super(key: key);

  final String? tittle;
  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: transparant,
            padding:
                const EdgeInsets.only(left: 16, top: 20, right: 24, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 28,
                      color: darkColor.withOpacity(.7),
                    ),
                    SizedBox(width: 8),
                    Text(
                      tittle ?? '',
                      style: TextStyle(
                        color: darkColor,
                        fontFamily: 'Ubuntu',
                        // fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: darkColor.withOpacity(.7),
                )
              ],
            ),
          ),
        ),
        Divider(
          thickness: .5,
          color: darkColor.withOpacity(.2),
          height: 0,
        ),
      ],
    );
  }
}
