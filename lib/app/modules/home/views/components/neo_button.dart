import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NeoButton extends StatelessWidget {
  const NeoButton({
    Key? key,
    required this.tittle,
    required this.svg,
    required this.onTap,
  }) : super(key: key);

  final String tittle;
  final String svg;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(1),
        height: 70,
        width: Get.width * .17,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(6, 6),
              color: hitam.withOpacity(.5),
            ),
            BoxShadow(
              blurRadius: 10,
              offset: Offset(-6, -6),
              color: putih.withOpacity(.15),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            SvgPicture.asset(
              svg,
              height: 24,
              color: textColor,
            ),
            SizedBox(height: 8),
            Text(
              tittle.toUpperCase(),
              style: TextStyle(
                color: textColor,
                fontFamily: "Montserrat",
                fontSize: 8,
              ),
            )
          ],
        ),
      ),
    );
  }
}
