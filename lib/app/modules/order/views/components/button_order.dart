import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonOrderisNotEmpty extends StatelessWidget {
  const ButtonOrderisNotEmpty({
    Key? key,
    this.icon,
    this.tittle,
    this.color,
    this.onTap,
    this.size = 20,
  }) : super(key: key);

  final VoidCallback? onTap;
  final IconData? icon;
  final String? tittle;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    Get.put(MenuController());
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        height: 48,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                putih.withOpacity(.25),
                color!.withOpacity(.50),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24)),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5),
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                color: darkColor,
                size: size,
              ),
            ),
            SizedBox(width: 12),
            Text(
              tittle!,
              style: TextStyle(
                color: darkColor,
                fontFamily: 'Ubuntu',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
