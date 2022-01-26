import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bottom_sheet/bottom_sheet.dart';

class ButtonChart extends StatelessWidget {
  const ButtonChart({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: [
            Container(
              height: 110,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [putih.withOpacity(0), putih.withOpacity(.3)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 50,
                left: 30,
                right: 30,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  colors: gd,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 24,
                    offset: Offset(8, 8),
                    color: hitam.withOpacity(.5),
                  ),
                ],
                border: Border.all(
                  color: putih.withOpacity(.5),
                  width: .5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "7 items",
                        style: TextStyle(
                          color: textColor,
                          fontFamily: "Montserrat",
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Table 8 - (Masda agus)",
                        style: TextStyle(
                          color: textColor,
                          fontFamily: "Montserrat",
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Rp48.000",
                        style: TextStyle(
                          color: textColor,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 6),
                      // SvgPicture.asset("assetName"),
                      Icon(
                        Icons.shopping_cart_sharp,
                        color: textColor,
                        size: 20,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
