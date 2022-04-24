import 'package:flutter/material.dart';

class TextFieldHome extends StatelessWidget {
  const TextFieldHome({
    Key? key,
    this.controller,
    this.isTextTypeNumber = true,
    this.label,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool isTextTypeNumber;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: TextField(
        keyboardType: isTextTypeNumber ? TextInputType.number : null,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          labelText: label,
        ),
      ),
    );
  }
}
