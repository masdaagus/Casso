import 'dart:developer';

import 'package:casso/app/data/model/product_model.dart';
import 'package:casso/app/services/core/sql_helper.dart';

class ProductService {
  Future<void> initProduct() async {
    await productsSetupInitial.map((e) => SQLHelper.insertData(e)).toList();
  }

  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> products = await SQLHelper.getItems();
    return products;
  }

  Future<int> insertProduct(ProductModel product) async {
    final id = await SQLHelper.insertData(product);
    return id;
  }

  Future<int> updateProduct(ProductModel product) async {
    final _id = await SQLHelper.updateData(product);

    return _id;
  }

  Future<int> deleteProduct(ProductModel product) async {
    final _id = await SQLHelper.deleteProducts(product);
    return _id;
  }
}

final productsSetupInitial = [
  ProductModel(
    id: 1,
    productCategory: 'FOOD',
    productName: 'Ikan Bakar',
    productPrice: 200.0,
    productQty: 0,
    productImage: null,
  ),
  ProductModel(
    id: 2,
    productCategory: 'DRINK',
    productName: 'Milkshake Mangga',
    productPrice: 150,
    productQty: 0,
    productImage: null,
  ),
];
