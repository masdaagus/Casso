import 'package:get/get.dart';

class MonitoringController extends GetxController {
  List<Map<String, dynamic>> listData = [
    {
      "table": 2,
      "guessName": "Masda",
      "timeOrder": "Baru aja",
      "orders": [
        "Milkshake Durian",
        "Nasi Goreng",
        "Kentang Goreng",
        "Ifumie",
      ]
    },
    {
      "table": 7,
      "guessName": "Agus",
      "timeOrder": "3 Menit",
      "orders": [
        "Milkshake Nangka",
        "Nasi Goreng",
        "Kentang Goreng",
        "Ifumie",
      ]
    },
    {
      "table": 12,
      "guessName": "Ruswoko",
      "timeOrder": "Baru saja",
      "orders": [
        "Milkshake Salak",
        "Nasi Goreng",
        "Ubi Goreng",
        "Bakso Bakar",
      ]
    },
  ];

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
