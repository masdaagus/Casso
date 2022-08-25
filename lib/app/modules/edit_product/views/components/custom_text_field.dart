import 'package:casso/app/modules/product/controllers/product_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.label,
    this.isNumtype = true,
    this.hintText,
    this.controller,
    this.validator,

    // this.icon,
    // this.textFormField,
  }) : super(key: key);

  final bool isNumtype;
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  // final IconData? icon;
  // final Widget? textFormField;

  @override
  Widget build(BuildContext context) {
    // final ctrl = Get.find<ProductController>();
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: putih,
      ),
      child: TextFormField(
        keyboardType: isNumtype ? TextInputType.number : null,
        validator: validator,
        maxLength: 30,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          labelText: label,
          isDense: true,
          errorStyle: TextStyle(
            color: merah,
            fontFamily: "Ubuntu",
            fontSize: 14,
            letterSpacing: .5,
          ),
          counterText: "",
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w500,
            color: darkColor.withOpacity(.6),
          ),
          errorBorder: InputBorder.none,
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontSize: 14,
          fontFamily: "Ubuntu",
          fontWeight: FontWeight.w500,
          color: darkColor,
        ),
      ),
    );
  }
}
