import 'package:casso/app/data/constant.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonAll extends StatelessWidget {
  const ButtonAll({
    Key? key,
    required this.tittleButton,
    required this.onTap,
  }) : super(key: key);

  final String tittleButton;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        padding: const EdgeInsets.all(12),
        width: Get.width * .4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: .3,
            color: putih.withOpacity(.6),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 4,
              color: hitam.withOpacity(.3),
            ),
          ],
          gradient: LinearGradient(
            colors: [
              darkColor.withOpacity(.10),
              biru.withOpacity(.10),
              orange.withOpacity(.10),
            ],
            stops: [.2, .4, .8],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            tittleButton.toUpperCase(),
            style: TextStyle(
              color: putih.withOpacity(.9),
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
