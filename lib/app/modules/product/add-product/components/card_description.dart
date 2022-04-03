import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class CradDeskripsi extends StatelessWidget {
  const CradDeskripsi({
    Key? key,
    this.textController,
    this.description,
  }) : super(key: key);

  final TextEditingController? textController;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 140,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: lightColor.withOpacity(.2)),
      ),
      child: TextField(
        controller: textController,
        maxLines: 6,
        style: TextStyle(
          fontSize: 14,
          fontFamily: "balsamiq",
          fontWeight: FontWeight.w500,
          color: abu,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 81),
            child: Icon(Icons.input_outlined, color: abu),
          ),
          hintText: description,
          hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: "balsamiq",
            fontWeight: FontWeight.w500,
            color: abu.withOpacity(.7),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
