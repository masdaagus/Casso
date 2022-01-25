import 'dart:ui';

import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';

class BotomSheet extends StatelessWidget {
  const BotomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            putih.withOpacity(.3),
            putih.withOpacity(.25),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 20,
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 50),
                height: 6,
                width: 100,
                decoration: BoxDecoration(
                  color: textColor,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                padding: const EdgeInsets.all(16),
                // height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: putih,
                  gradient: LinearGradient(
                    colors: [
                      abu.withOpacity(.8),
                      abu.withOpacity(.5),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nasi Goreng Seafood",
                          style: TextStyle(
                              color: primaryColor,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: -1),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Rp23.000",
                          style: TextStyle(
                              color: primaryColor,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              letterSpacing: -1),
                        ),
                        SizedBox(height: 16),
                        notes()
                      ],
                    ),
                    Row(
                      children: [
                        IconPlusMinus(Icons.linear_scale_sharp),
                        SizedBox(width: 18),
                        Text(
                          "2",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 18),
                        IconPlusMinus(Icons.add),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container notes() {
    return Container(
      padding: const EdgeInsets.all(4),
      height: 25,
      width: 75,
      decoration: BoxDecoration(
        border: Border.all(
          color: hitam.withOpacity(.4),
          width: .5,
        ),
        borderRadius: BorderRadius.circular(6),
        color: hitam.withOpacity(.16),
      ),
      child: Row(
        children: [
          Icon(
            Icons.notes_sharp,
            size: 16,
          ),
          SizedBox(width: 8),
          Text(
            "Notes",
            style: TextStyle(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Container IconPlusMinus(IconData icon) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Icon(
        icon,
        color: Colors.green,
      ),
    );
  }
}
