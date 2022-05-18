import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.icon,
    this.stringValidation,
    this.isObsecure = false,
    this.controller,
    this.validator,
    this.isPassword = false,
    this.tapToHide,
  }) : super(key: key);

  final String? stringValidation;
  final String? hintText;
  final IconData? icon;
  final bool isObsecure;
  final bool isPassword;
  final TextEditingController? controller;
  final VoidCallback? tapToHide;
  final FormFieldValidator<String>? validator;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: isPassword ? TextInputType.number : null,
                  controller: controller,
                  obscureText: isObsecure,
                  validator: validator,
                  textInputAction:
                      isPassword ? TextInputAction.done : TextInputAction.next,
                  style: TextStyle(
                    color: darkColor,
                    fontFamily: "Ubuntu",
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
                    ),
                  ),
                ),
              ),
              isPassword
                  ? GestureDetector(
                      onTap: tapToHide,
                      child: Container(
                        width: 48,
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          color: darkColor.withOpacity(.7),
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(width: 8)
            ],
          ),
          (stringValidation != null)
              ? Container(
                  margin: const EdgeInsets.only(left: 56, bottom: 8),
                  child: Text(
                    stringValidation!,
                    style: const TextStyle(color: merah, fontFamily: 'Ubuntu'),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
