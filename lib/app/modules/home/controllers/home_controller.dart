import 'dart:developer';

import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/modules/home/controllers/keypad_controller.dart';
import 'package:casso/app/services/products/product_service.dart';
import 'package:get/get.dart';

import '../../../data/model/product_model.dart';
import '../../../data/model/transaction_model.dart';
import '../../../data/model/user_model.dart';
import '../../../services/transaction/transaction_service.dart';

class HomeController extends GetxController {
  final auth = Get.find<AuthController>();
  final _sqlProducts = ProductService();
  final _serviceTransaction = TransactionService();

  var user = UserModel().obs;

  bool isLoading = false;

  var products = <ProductModel>[].obs;
  var productsOrder = <ProductModel>[].obs;
  var transactions = <TransactionModel>[].obs;

  DateTime now = DateTime.now();

  Future<List<ProductModel>> get getProducts => _getProducts();

  Future<List<ProductModel>> _getProducts() async {
    var _products = await _sqlProducts.getProducts();
    products.value = _products;
    return products;
  }

  Future<void> insertProducts() async {
    await _sqlProducts.initProduct();
  }

  Future<void> addProductOrder(ProductModel product) async {
    final ids = Set();
    product.productQty++;
    productsOrder.add(product);

    productsOrder.retainWhere((x) => ids.add(x.id));
    update();
  }

  void decrementProductOrder(ProductModel product) {
    product.productQty--;
    if (product.productQty <= 0) {
      productsOrder.remove(product);
    }
    update();
  }

  void removeProductOrder(ProductModel product) {
    productsOrder.remove(product);
    update();
  }

  void clearListOrder() {
    for (int i = 0; i < productsOrder.length; i++) {
      productsOrder[i].productQty = 0;
    }
    productsOrder.clear();
    update();
  }

  Future<void> setTransaction() async {
    final ids = Set();
    double _totalPrices = 0;
    productsOrder.retainWhere((x) => ids.add(x.id));

    productsOrder.value.forEach((prod) {
      _totalPrices += (prod.productPrice! * prod.productQty);
    });

    final trx = TransactionModel(
      createAt: now.toIso8601String(),
      productsTransaction: productsOrder.value,
      totalPrices: _totalPrices,
    );

    if (_totalPrices != 0) {
      await _serviceTransaction.makeTransaction(
        user.value.uid!,
        trx,
        productsOrder,
      );
      productsOrder.clear();
      await readTransations();
      update();
    }
  }

  Future<List<TransactionModel>> readTransations() async {
    await _serviceTransaction.asyncTrxTofirebase();
    final _tansactions = await _serviceTransaction.readTransactions();
    transactions.value = _tansactions;
    return _tansactions;
  }

  Future<void> aysncTrx() async {
    await _serviceTransaction.asyncTrxTofirebase();
  }

  @override
  void onInit() async {
    user = auth.user;
    await _getProducts();
    await readTransations();
    super.onInit();
    await aysncTrx();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
