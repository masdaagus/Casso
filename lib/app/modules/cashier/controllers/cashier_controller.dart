import 'package:get/get.dart';

class CashierController extends GetxController {
  //TODO: Implement CashierController

  final List<String> prices = ["23.000", "17.000", "21.000", "16.000"];
  final List<String> items = ["Milkshake", "Jus Melon", "Dimsum", "Rabung"];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
