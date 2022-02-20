import 'dart:ui';

import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.obscure = false,
  }) : super(key: key);

  final String hint;
  final IconData icon;
  final bool obscure;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              height: 16,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    biru.withOpacity(.7),
                    orange.withOpacity(.7),
                    ungu.withOpacity(.7),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0, 0.5, 1],
                ),
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 22,
              sigmaY: 22,
            ),
            child: Container(
              padding: const EdgeInsets.all(padding / 2),
              margin: const EdgeInsets.only(bottom: padding),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: putih.withOpacity(.2),
                border: Border.all(
                  color: putih.withOpacity(.25),
                ),
              ),
              child: TextField(
                controller: controller,
                obscureText: obscure,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  suffixIcon: obscure ? Icon(Icons.remove_red_eye) : null,
                  border: InputBorder.none,
                  hintText: hint,
                  icon: Icon(icon),
                  hintStyle: TextStyle(
                    fontSize: 14,
                    letterSpacing: .75,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
