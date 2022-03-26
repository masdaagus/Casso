import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/products.dart';

import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final auth = Get.find<AuthController>();
  var user = UsersModel().obs;
  var resto = RestosModel().obs;
  List<ProductOrder> products = [];

  late TextEditingController namaProduct;
  late TextEditingController hargaProduct;

  List<String> image = [
    "assets/products/ayampenyet.jpg",
    "assets/products/bakso_bakar.jpeg",
    "assets/products/ikanbakar.jpg",
    "assets/products/kentang_goreng.jpeg",
    "assets/products/milkshakestroberi.jpg",
    "assets/products/nasigoreng.JPG",
    "assets/products/sanger.jpg",
    "assets/products/satetaichan.jpg",
    "assets/products/tehmanis.jpeg",
  ];

  Future<void> _productsInit() async {
    var food = resto.value.products!.food as List<ProductCategory>;
    var drink = resto.value.products!.drink as List<ProductCategory>;
    var dessert = resto.value.products!.dessert as List<ProductCategory>;

    food.forEach((data) {
      products.add(ProductOrder(
        productName: data.foodName,
        productPrice: data.foodPrice,
        productQty: 0,
        productCategory: 'FOOD',
      ));
    });

    drink.forEach((data) {
      products.add(ProductOrder(
        productName: data.foodName,
        productPrice: data.foodPrice,
        productQty: 0,
        productCategory: 'DRINK',
      ));
    });

    dessert.forEach((data) {
      products.add(ProductOrder(
        productName: data.foodName,
        productPrice: data.foodPrice,
        productQty: 0,
        productCategory: 'DESSERT',
      ));
    });
  }

  @override
  void onInit() async {
    user = auth.user;
    resto = auth.resto;
    await _productsInit();

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
