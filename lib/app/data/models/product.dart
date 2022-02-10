// To parse this JSON data, do
//
//     final makanan = makananFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.productName,
    this.productPrice,
  });

  String? productName;
  double? productPrice;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productName: json["productName"],
        productPrice: json["productPrice"],
      );

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "productPrice": productPrice,
      };
}
