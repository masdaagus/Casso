import 'package:flutter/material.dart';

import '../../../../utils/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.tittle,
    this.conroller,
    this.validator,
    this.numType = false,
    this.readOnly = false,
  }) : super(key: key);

  final String? tittle;
  final TextEditingController? conroller;
  final FormFieldValidator<String>? validator;
  final bool numType;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      readOnly: readOnly,
      controller: conroller,
      style: TextStyle(
        color: darkColor,
        fontFamily: 'Ubuntu',
      ),
      keyboardType: numType ? TextInputType.number : null,
      decoration: InputDecoration(
          labelText: '$tittle',
          labelStyle: TextStyle(
            fontFamily: 'Ubuntu',
          )),
    );
  }
}
