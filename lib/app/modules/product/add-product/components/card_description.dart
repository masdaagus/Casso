import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class CradDeskripsi extends StatelessWidget {
  const CradDeskripsi({
    Key? key,
    this.textController,
  }) : super(key: key);

  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: abu),
      ),
      child: TextField(
        controller: textController,
        maxLines: 6,
        style: TextStyle(
          fontSize: 14,
          fontFamily: "Ubuntu",
          fontWeight: FontWeight.w500,
          color: darkColor,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 41),
            child: Icon(Icons.input_outlined, color: darkColor),
          ),
          hintText: 'Deskripsi produk',
          hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w500,
            color: darkColor.withOpacity(.6),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
