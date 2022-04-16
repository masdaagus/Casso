import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 280,
      // width: 280,
      // decoration: BoxDecoration(
      //   color: lightColor,
      //   boxShadow: [
      //     BoxShadow(
      //       blurRadius: 4,
      //       offset: Offset(6, 6),
      //       color: hitam.withOpacity(.25),
      //     ),
      //     BoxShadow(
      //       blurRadius: 4,
      //       offset: Offset(-6, -6),
      //       color: putih.withOpacity(.15),
      //     ),
      //   ],
      //   borderRadius: BorderRadius.circular(32),
      // ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/alert.png',
            scale: 8,
          ),
          const SizedBox(height: 24),
          const Text(
            "CONFIRMATION",
            style: TextStyle(
              color: hitam,
              fontFamily: 'balsamiq',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Apakah anda yakin akan set status\npesanan ke tersaji ?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: darkColor.withOpacity(.7),
              fontFamily: 'balsamiq',
              fontSize: 14,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              height: 32,
              width: 80,
              decoration: BoxDecoration(
                color: Color(0XFFFF8354),
                borderRadius: BorderRadiusDirectional.circular(16),
              ),
              child: Center(
                child: Text(
                  "Yess",
                  style: TextStyle(
                    color: putih,
                    fontFamily: 'balsamiq',
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
