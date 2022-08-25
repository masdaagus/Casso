import 'dart:developer';
import 'dart:math' as math;

import 'package:casso/app/data/model/product_model.dart';
import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class KeypadController extends GetxController {
  final homeController = Get.find<HomeController>();
  var calculatorString = ''.obs;

  String get keypadValue => calculatorString.value;

  void onPressed({String? buttonText}) {
    if (buttonText == 'C') {
      calculatorString.value = '';
    } else if (buttonText == '+') {
      if (calculatorString != '') {
        addCa();
      }
    } else {
      calculatorString.value += buttonText!;
      if (calculatorString.value[0] == '0') {
        calculatorString.value = '';
      }
    }
  }

  int random() {
    int _ran = 0;
    var rng = math.Random();
    _ran = rng.nextInt(1000);
    return _ran;
  }

  void addCa() {
    random();
    ProductModel _product = ProductModel(
      id: random(),
      productName: 'Custom Ammount',
      productPrice: double.parse(calculatorString.value),
    );

    homeController.addProductOrder(_product);
    calculatorString.value = '';
  }
}
