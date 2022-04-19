import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.icon,
    this.isObsecure = false,
    this.isCanHide = false,
    this.controller,
    this.isNumType = false,
    this.tapToHide,
  }) : super(key: key);

  final String? hintText;
  final IconData? icon;
  final bool isObsecure;
  final bool isCanHide;
  final bool isNumType;
  final TextEditingController? controller;
  final VoidCallback? tapToHide;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      // height: 48,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              lightColor,
              biru.withOpacity(.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.45, 1]),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Color(0XFF7CD2B7).withOpacity(.5), width: .5),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              keyboardType: isNumType ? TextInputType.number : null,
              controller: controller,
              obscureText: isObsecure,
              style: TextStyle(
                color: darkColor,
                fontFamily: "Ubuntu",
                letterSpacing: .5,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                icon: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Icon(icon, color: darkColor.withOpacity(.7)),
                ),
                hintStyle: TextStyle(
                  color: darkColor.withOpacity(.7),
                  fontFamily: "Ubuntu",
                  letterSpacing: .5,
                ),
              ),
            ),
          ),
          isCanHide
              ? GestureDetector(
                  onTap: tapToHide,
                  child: Container(
                    width: 48,
                    child: Icon(
                      Icons.remove_red_eye,
                      color: darkColor.withOpacity(.7),
                    ),
                  ),
                )
              : Container(),
          SizedBox(width: 8)
        ],
      ),
    );
  }
}
