import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class NullWidget extends StatelessWidget {
  const NullWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(backgroundColor: darkColor),
      body: Center(
        child: Text(
          "Ada kesalahan",
          style: TextStyle(
            color: darkColor,
            fontFamily: 'Ubuntu',
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
