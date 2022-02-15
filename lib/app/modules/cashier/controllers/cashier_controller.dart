import 'package:get/get.dart';

class CashierController extends GetxController {
  final List<int> table = [1, 12, 7, 9];
  final List<String> names = ["Masda agus", "Yanto", "Wahyu", "Sukini"];
  final List<String> items = ["Milkshake", "Jus Melon", "Dimsum", "Rabung"];
  final List<String> prices = ["23.000", "17.000", "21.000", "16.000"];

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
