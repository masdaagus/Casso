import 'package:get/get.dart';

class MenuController extends GetxController {
  final itemCount = 0.obs;

  List<Map<String, dynamic>> makanan = [
    {
      "namaMakanan": "Milkshake Salak",
      "hargaMakanan": 12000,
    },
    {
      "namaMakanan": "Milkshake Strowberry",
      "hargaMakanan": 17000,
    },
    {
      "namaMakanan": "Milkshake Nangka",
      "hargaMakanan": 18000,
    },
    {
      "namaMakanan": "Milkshake Jambu",
      "hargaMakanan": 22000,
    },
    {
      "namaMakanan": "Milkshake Durian",
      "hargaMakanan": 34000,
    },
    {
      "namaMakanan": "Nasi Goreng",
      "hargaMakanan": 15000,
    },
    {
      "namaMakanan": "Lintah Panggang",
      "hargaMakanan": 19000,
    },
    {
      "namaMakanan": "Salak Pondo",
      "hargaMakanan": 22000,
    },
  ];

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
  increment() => itemCount.value++;
}
