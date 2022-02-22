import 'package:casso/app/data/constant.dart';
import 'package:casso/app/utils/spinner.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: primaryColor, body: CustomSpinner()),
    );
  }
}
