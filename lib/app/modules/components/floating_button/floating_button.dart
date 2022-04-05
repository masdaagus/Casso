import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({Key? key, this.onTap}) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: biru,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Icon(
          Icons.add,
          color: darkColor,
          size: 48,
        ),
      ),
    );
  }
}
