import 'package:casso/app/modules/introduction/views/components/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/introduction_controller.dart';
import 'components/welcome_screen.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return WelcomeScreen();
  }
}
