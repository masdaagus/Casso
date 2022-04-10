import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class HeaderDashboard extends StatelessWidget {
  const HeaderDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 8, right: 8, top: 32),
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              color: abu,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.ramen_dining,
                    size: 48,
                    color: darkColor,
                  ),
                  Text(
                    "Hujrina Coffie",
                    style: TextStyle(
                      color: darkColor,
                      fontFamily: 'balsamiq',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: -40,
            top: 50,
            child: Container(
              height: 216,
              width: 216,
              // color: merah,
              child: Image.asset("assets/images/robo.png"),
            ),
          )
        ],
      ),
    );
  }
}
