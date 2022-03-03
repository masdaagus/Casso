import 'package:casso/app/controllers/auth_controller.dart';
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
  List<ProductCategory> allProducts = [];

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

  void getAllProducts() async {
    List<ProductCategory> food =
        resto.value.products!.food as List<ProductCategory>;
    List<ProductCategory> drink =
        resto.value.products!.drink as List<ProductCategory>;
    List<ProductCategory> dessert =
        resto.value.products!.dessert as List<ProductCategory>;

    food.forEach((element) {
      allProducts.add(ProductCategory(
        foodName: element.foodName,
        foodPrice: element.foodPrice,
      ));
    });
    drink.forEach((element) {
      allProducts.add(ProductCategory(
        foodName: element.foodName,
        foodPrice: element.foodPrice,
      ));
    });
    dessert.forEach((element) {
      allProducts.add(ProductCategory(
        foodName: element.foodName,
        foodPrice: element.foodPrice,
      ));
    });

    print(allProducts.length);
  }

  @override
  void onInit() {
    user = auth.user;
    resto = auth.resto;
    getAllProducts();

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
