import 'dart:developer';
import 'dart:io';

import 'package:casso/app/data/models/product.dart';
import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/modules/home/views/home_view.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  final auth = Get.find<AuthController>();
  var user = UsersModel().obs;
  var resto = RestosModel().obs;

  bool isLoading = false;

  var data = ['FOOD', 'DRINK', 'DESSERT'].obs;
  var selected = 'FOOD'.obs;

  List<Product> products = [];

  late TextEditingController namaProduk;
  late TextEditingController hargaProduk;
  late TextEditingController stokProduk;
  late TextEditingController deskripsiProduk;

  XFile? pickedImage = null;
  String? imageUrl = null;
  File? compressedImage = null;

  Rx<List<Product>> foundAllProducts = Rx<List<Product>>([]);
  Rx<List<Product>> foundFoodProducts = Rx<List<Product>>([]);
  Rx<List<Product>> foundDrinkProducts = Rx<List<Product>>([]);
  Rx<List<Product>> foundDessertProducts = Rx<List<Product>>([]);

  void removeImage() async {
    pickedImage = null;
    update();
  }

  Future<void> _uploadImage() async {
    final storageRef = await storage.ref("${pickedImage!.name}");

    try {
      if (compressedImage != null) {
        File file = File(compressedImage!.absolute.path);
        await storageRef.putFile(file);
        final _imageUrl = await storageRef.getDownloadURL();
        imageUrl = _imageUrl;
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<File> _compressImage(String filePath) async {
    final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";

    var result = await FlutterImageCompress.compressAndGetFile(
      pickedImage!.path,
      outPath,
      format: CompressFormat.jpeg,
      quality: 10,
    );

    compressedImage = result;
    update();

    return compressedImage!;
  }

  Future<bool> selectImage() async {
    final ImagePicker _picker = ImagePicker();

    try {
      final _image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 600,
        maxWidth: 600,
      );

      var file = File(_image!.path);
      int sizeFile = file.lengthSync();
      double size = sizeFile / (1024 * 1024);

      if (size < .3) {
        pickedImage = _image;
        await _compressImage(pickedImage!.path);

        update();
      }
      return true;
    } catch (e) {
      print(e);
      pickedImage = null;
      return false;
    }
  }

  Future<void> _productsInit() async {
    products = resto.value.products! as List<Product>;
    foundAllProducts.value = products;
    foundDessertProducts.value =
        products.where((d) => d.productCategory == 'DESSERT').toList();
    foundFoodProducts.value =
        products.where((d) => d.productCategory == 'FOOD').toList();
    foundDrinkProducts.value =
        products.where((d) => d.productCategory == 'DRINK').toList();
  }

  /// ADD PRIDUCT
  Future<void> addProduct() async {
    CollectionReference restos = firestore.collection('restos');

    List<Product> products = resto.value.products as List<Product>;

    bool isSame = false;

    try {
      isLoading = true;
      update();
      if (compressedImage != null) {
        await _uploadImage();
      }

      Product product = Product(
        productName: namaProduk.text.trim(),
        productPrice: double.tryParse(hargaProduk.text.trim()),
        productCategory: selected.value,
        productStock: int.tryParse(stokProduk.text.trim()) ?? 100,
        productDescription: deskripsiProduk.text.trim(),
        productImage: imageUrl ?? null,
      );

      products.forEach((e) {
        if (e.productName == product.productName) {
          isSame = true;
        }
      });

      if (!isSame) {
        products.add(product);
        await restos.doc(user.value.restoID).update({
          "products": List<dynamic>.from(
            products.map(
              (x) => x.toJson(),
            ),
          ),
        });

        log('BERHASIL MENAMBAHKAN PRODUCT');
        pickedImage = null;

        /// FUNGSI UNTUK MEREFRESH DATA

        final restoDoc = await restos.doc(user.value.restoID).get();
        final restoData = restoDoc.data() as Map<String, dynamic>;
        resto(RestosModel.fromJson(restoData));
        resto.refresh();
        auth.refresh();
        isLoading = false;
        update();

        Get.offAll(() => HomeView());
      } else {
        isLoading = false;
        log('TIDAK BISA MENAMBAHKAN PRODUCT');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteProduct(Product dataProduct) async {
    CollectionReference restos = firestore.collection('restos');

    List<Product> products = resto.value.products as List<Product>;
    Product? produk;

    isLoading = true;
    update();

    products.forEach((data) {
      if (data.productName == dataProduct.productName &&
          data.productPrice == dataProduct.productPrice) {
        produk = data;
      }
    });

    if (produk != null) {
      products.remove(produk);
      await restos.doc(user.value.restoID).update({
        "products": List<dynamic>.from(
          products.map(
            (x) => x.toJson(),
          ),
        ),
      });

      /// FUNGSI UNTUK MEREFRESH DATA
      final restoDoc = await restos.doc(user.value.restoID).get();
      final restoData = restoDoc.data() as Map<String, dynamic>;
      resto(RestosModel.fromJson(restoData));
      resto.refresh();
      auth.refresh();
      isLoading = false;
      update();

      Get.offAll(() => HomeView());
    }
  }

  Future<void> editProduct(Product dataProduct) async {
    isLoading = true;
    update();
    CollectionReference restos = firestore.collection('restos');

    List<Product> products = resto.value.products as List<Product>;
    Product? produk;

    products.forEach((data) {
      if (data.productName == dataProduct.productName &&
          data.productPrice == dataProduct.productPrice) {
        produk = data;
      }
    });
    if (produk != null) {
      try {
        if (compressedImage != null) {
          await _uploadImage();
        }

        Product addProduct = Product(
          productName: namaProduk.text,
          productPrice: double.tryParse(hargaProduk.text) ?? 0,
          productCategory: selected.value,
          productStock: int.tryParse(stokProduk.text),
          productDescription: deskripsiProduk.text,
          productImage: imageUrl ?? dataProduct.productImage,
        );

        products.remove(produk);
        products.add(addProduct);
        await restos.doc(user.value.restoID).update({
          "products": List<dynamic>.from(
            products.map(
              (x) => x.toJson(),
            ),
          ),
        });
        pickedImage = null;

        /// FUNGSI UNTUK MEREFRESH DATA
        final restoDoc = await restos.doc(user.value.restoID).get();
        final restoData = restoDoc.data() as Map<String, dynamic>;
        resto(RestosModel.fromJson(restoData));
        resto.refresh();
        auth.refresh();
        isLoading = false;
        update();
        Get.offAll(() => HomeView());
      } catch (e) {
        print(e);
      }
    }
  }

  void filterAllProducts(String data) {
    List<Product> result = [];

    if (data.isEmpty) {
      result = products;
      update();
    } else {
      result = products
          .where((product) =>
              product.productName!.toLowerCase().contains(data.toLowerCase()))
          .toList();
    }

    foundAllProducts.value = result;
    update();
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
    pickedImage == null;
    super.onClose();
  }
}
