import 'package:flutter/material.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
          child: Text(
            "data",
            style: TextStyle(fontSize: 90),
          ),
        ),
      ),
    );
  }
}
