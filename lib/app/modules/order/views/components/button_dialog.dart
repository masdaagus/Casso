import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    Key? key,
    this.isConfirm = true,
    this.isConfirmText = 'CONFIRM',
    this.onTap,
  }) : super(key: key);

  final bool isConfirm;
  final String isConfirmText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          isConfirmText,
          style: TextStyle(
            color: lightColor,
            fontFamily: "balsamiq",
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontSize: 12,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          primary: isConfirm ? hijau.withOpacity(.5) : merah.withOpacity(.5),
        ),
      ),
    );
  }
}
