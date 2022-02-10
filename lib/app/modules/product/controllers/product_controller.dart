import 'package:casso/app/data/models/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  Product product = Product();

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
