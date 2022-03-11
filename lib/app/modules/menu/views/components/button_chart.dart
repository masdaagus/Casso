import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class ButtonChart extends StatelessWidget {
  const ButtonChart({
    Key? key,
    required this.table,
    required this.onTap,
    this.items = 0,
    this.totalPrice,
    this.guessName = 'Jojon',
  }) : super(key: key);

  final int table;
  final int items;
  final double? totalPrice;
  final String? guessName;
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
                  colors: [darkColor.withOpacity(0), darkColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 40,
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
                  colors: [darkColor, darkColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    offset: Offset(4, 4),
                    color: hitam.withOpacity(.35),
                  ),
                  BoxShadow(
                    blurRadius: 8,
                    offset: Offset(-4, -4),
                    color: putih.withOpacity(.10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$items items",
                        style: TextStyle(
                          color: textColor,
                          fontFamily: "Montserrat",
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Table ${table} - (${guessName})",
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
                        "$totalPrice",
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
