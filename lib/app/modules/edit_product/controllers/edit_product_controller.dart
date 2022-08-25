import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:casso/app/data/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controllers/auth_controller.dart';
import '../../../data/model/user_model.dart';
import '../../../services/products/product_service.dart';
import '../../home/controllers/home_controller.dart';

class EditProductController extends GetxController {
  final auth = Get.find<AuthController>();
  final home = Get.find<HomeController>();
  final _sqlProducts = ProductService();
  var user = UserModel().obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  TextEditingController namaProduk = TextEditingController();
  TextEditingController hargaProduk = TextEditingController();
  TextEditingController categoryProduk = TextEditingController();

  Uint8List? image8 = null;
  String? _imageBytes = null;

  bool isLoading = false;

  String? get stringImage => _imageBytes;

  Future<bool> selectImage() async {
    final ImagePicker _picker = ImagePicker();

    try {
      final _image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 2000,
        maxWidth: 2000,
      );
      File? _compressedImage = await _compressImage(_image!.path);

      log(_image.path);

      image8 = await _compressedImage!.readAsBytes();

      _imageBytes = base64Encode(image8!);

      update();

      return true;
    } catch (e) {
      log(e.toString());
      image8 = null;
      return false;
    }
  }

  Future<File?> _compressImage(String filePath) async {
    final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";

    var result = await FlutterImageCompress.compressAndGetFile(
      filePath,
      outPath,
      format: CompressFormat.jpeg,
      quality: 50,
    );

    update();
    return result;
  }

  void removeImage() async {
    image8 = null;
    update();
  }

  Future<int> insertProduct() async {
    ProductModel data = ProductModel(
      productName: namaProduk.text,
      productPrice: double.tryParse(hargaProduk.text),
      productCategory: categoryProduk.text,
      productImage: _imageBytes,
    );

    final id = await _sqlProducts.insertProduct(data);
    await home.getProducts;
    return id;
  }

  Future<int> updateProduct(ProductModel data) async {
    final id = await _sqlProducts.updateProduct(data);
    await home.getProducts;

    return id;
  }

  Future<int> deleteProduct(ProductModel data) async {
    final id = await _sqlProducts.deleteProduct(data);
    await home.getProducts;
    log("id nya = ${id}");
    return id;
  }

  @override
  void onInit() {
    user = auth.user;
    super.onInit();
  }

  @override
  void onClose() {
    namaProduk.clear();
    hargaProduk.clear();
    categoryProduk.clear();
  }
}
