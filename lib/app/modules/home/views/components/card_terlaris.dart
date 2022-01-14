import 'dart:ui';

import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';

class CardTerlaris extends StatelessWidget {
  const CardTerlaris({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned(
              right: 18,
              top: 7,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: ungu.withOpacity(.7),
                ),
              ),
            ),
            Positioned(
              right: 12,
              top: 45,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: biru.withOpacity(.7),
                ),
              ),
            ),
            Positioned(
              right: 50,
              top: 20,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: orange.withOpacity(.7),
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 25,
                sigmaY: 25,
              ),
              child: Container(
                height: 100,
                width: 250,
                padding: const EdgeInsets.all(padding / 2),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [putih.withOpacity(.25), putih.withOpacity(.15)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: putih.withOpacity(.3)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Milkshake Coklat",
                          style: TextStyle(
                            color: textColor,
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "23.000",
                          style: TextStyle(
                            color: textColor.withOpacity(.7),
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: padding),
                        Text(
                          "Terpesan = 33x",
                          style: TextStyle(
                            color: textColor.withOpacity(.7),
                            fontFamily: "Montserrat",
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 65,
                      width: 60,
                      child: Image.asset(
                        "assets/images/milkshake-coklat 1.png",
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
