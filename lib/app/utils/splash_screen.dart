import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: Container(
            child: Lottie.asset("assets/lottie/burger.json"),
          ),
        ),
      ),
    );
  }
}
