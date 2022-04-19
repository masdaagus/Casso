import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        width: 164,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0XFFA0B5EB),
                Color(0XFFC9F0E4),
                // Color(0XFFDFE9F3),
                // putih,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: hitam.withOpacity(.3),
                blurRadius: 4,
                offset: Offset(4, 4),
              ),
              BoxShadow(
                color: putih.withOpacity(.3),
                blurRadius: 4,
                offset: Offset(-4, -4),
              ),
            ]),
        child: Center(
            child: Text(
          "KONFIRMASI",
          style: TextStyle(
            color: darkColor,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: .5,
          ),
        )),
      ),
    );
  }
}
