import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class CradDeskripsi extends StatelessWidget {
  const CradDeskripsi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 170,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: textColor),
      ),
      child: TextField(
        maxLines: 6,
        style: TextStyle(
          fontSize: 14,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 93),
            child: Icon(Icons.input_outlined, color: textColor),
          ),
          hintText: "Deskripsi",
          hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500,
            color: textColor.withOpacity(.7),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
