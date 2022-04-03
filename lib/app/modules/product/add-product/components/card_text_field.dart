import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class CardTextField extends StatelessWidget {
  const CardTextField({
    Key? key,
    this.hintText,
    this.icon,
    this.textController,
    this.isTextNumber = false,
  }) : super(key: key);
  final String? hintText;
  final IconData? icon;
  final TextEditingController? textController;
  final bool isTextNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: putih.withOpacity(.2),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: abu,
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: textController,
              keyboardType:
                  isTextNumber ? TextInputType.number : TextInputType.name,
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                color: lightColor,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w500,
                  color: lightColor.withOpacity(.7),
                ),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
