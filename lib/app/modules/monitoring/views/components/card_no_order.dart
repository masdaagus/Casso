import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class NoOrderWidget extends StatelessWidget {
  const NoOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.all(24),
      height: 275,
      width: 264,
      // decoration: BoxDecoration(
      //   color: darkColor,
      //   boxShadow: [
      //     // BoxShadow(
      //     //   blurRadius: 4,
      //     //   offset: Offset(6, 6),
      //     //   color: hitam.withOpacity(.25),
      //     // ),
      //     // BoxShadow(
      //     //   blurRadius: 4,
      //     //   offset: Offset(-6, -6),
      //     //   color: putih.withOpacity(.15),
      //     // ),
      //   ],
      //   borderRadius: BorderRadius.circular(32),
      // ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/no_message.png',
            scale: 8,
          ),
          const SizedBox(height: 24),
          const Text(
            "PESANAN KOSONG",
            style: TextStyle(
              color: hitam,
              fontFamily: 'Ubuntu',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: -.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Jika pesanan tidak kososng akan \ntampil di sini",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: darkColor.withOpacity(.7),
              fontFamily: 'Ubuntu',
              fontSize: 14,
            ),
          ),
        ],
      ),
    ));
  }
}
