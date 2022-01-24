import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardCategory extends StatelessWidget {
  const CardCategory({
    Key? key,
    this.pick = false,
    required this.tittle,
    required this.svg,
  }) : super(key: key);

  final bool pick;
  final String tittle;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 35,
      // width: 85,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: pick
                ? [
                    putih.withOpacity(.3),
                    putih.withOpacity(.1),
                  ]
                : [
                    primaryColor,
                    primaryColor,
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: pick
              ? null
              : [
                  BoxShadow(
                    blurRadius: 5,
                    offset: Offset(-2, -2),
                    color: putih.withOpacity(.15),
                  ),
                  BoxShadow(
                    blurRadius: 5,
                    offset: Offset(2, 2),
                    color: hitam.withOpacity(.20),
                  ),
                ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            svg,
            height: 20,
          ),
          SizedBox(width: 8),
          Text(
            tittle,
            style: TextStyle(
              fontSize: 12,
              color: textColor,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
