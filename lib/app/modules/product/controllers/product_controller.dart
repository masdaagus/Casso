import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/products.dart';

import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final auth = Get.find<AuthController>();
  var user = UsersModel().obs;
  var resto = RestosModel().obs;
  List<Product> products = [];

  late TextEditingController namaProduk;
  late TextEditingController hargaProduk;
  late TextEditingController stokProduk;
  late TextEditingController deskripsiProduk;

  var data = ['FOOD', 'DRINK', 'DESSERT'].obs;
  var selected = 'FOOD'.obs;

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
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
  ];

  Future<void> _productsInit() async {
    products = resto.value.products! as List<Product>;
  }

  Future<void> addProduct() async {
    CollectionReference restos = firestore.collection('restos');
    CollectionReference users = firestore.collection('users');

    final dataObject = await restos.doc(user.value.restoID).get();
    var data = dataObject.data() as Map<String, dynamic>;
    List<Product> products =
        List<Product>.from(data['products'].map((x) => Product.fromJson(x)))
            .toList();

    Product product = Product(
      productName: namaProduk.text,
      productPrice: double.tryParse(hargaProduk.text) ?? 0,
      productCategory: selected.value,
      productStock: int.tryParse(stokProduk.text) ?? 0,
      productDescription: deskripsiProduk.text,
    );

    products.add(product);

    await restos.doc(user.value.restoID).update({
      "products": List<dynamic>.from(
        products.map(
          (x) => x.toJson(),
        ),
      ),
    });

    /// FUNGSI UNTUK MEREFRESH DATA
    final restoId = await restos.doc(user.value.restoID).get();
    final restoData = restoId.data() as Map<String, dynamic>;
    resto(RestosModel.fromJson(restoData));
    resto.refresh();
    final userDoc = await users.doc(user.value.email).get();
    final userDocData = userDoc.data() as Map<String, dynamic>;
    user(UsersModel.fromJson(userDocData));
    user.refresh();
    Get.offAllNamed('/product');
  }

  @override
  void onInit() async {
    user = auth.user;
    resto = auth.resto;
    await _productsInit();

    namaProduk = TextEditingController();
    hargaProduk = TextEditingController();
    stokProduk = TextEditingController();
    deskripsiProduk = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namaProduk.dispose();
    hargaProduk.dispose();
    stokProduk.dispose();
    deskripsiProduk.dispose();
    super.onClose();
  }
}
