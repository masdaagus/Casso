import 'dart:ui';

import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';

class GlassButton extends StatelessWidget {
  const GlassButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Positioned(
              right: 4,
              bottom: 4,
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: biru.withOpacity(.7),
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 25,
                sigmaY: 25,
              ),
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [putih.withOpacity(.25), putih.withOpacity(.15)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: putih.withOpacity(.2)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.print_outlined,
                      color: textColor,
                      size: 43,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "KASIR",
                      style: TextStyle(
                        color: textColor,
                        fontFamily: "Montserrat",
                        fontSize: 14,
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
