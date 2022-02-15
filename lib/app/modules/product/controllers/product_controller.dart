import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late TextEditingController namaProduct;
  late TextEditingController hargaProduct;

  @override
  void onInit() {
    namaProduct = TextEditingController();
    hargaProduct = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namaProduct.dispose();
    hargaProduct.dispose();
    super.onClose();
  }
}
