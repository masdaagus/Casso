// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  const Products({
    this.ownerEmail,
    this.ownerName,
    this.restoLocation,
    this.restoName,
    this.restoTable,
    this.restoEmploye,
    this.products,
  });

  final String? ownerEmail;
  final String? ownerName;
  final String? restoLocation;
  final String? restoName;
  final String? restoTable;
  final RestoEmploye? restoEmploye;
  final List<Product>? products;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        // ownerEmail: json[ProductsFields.ownerEmail],
        // ownerName: json[ProductsFields.ownerName],
        // restoLocation: json[ProductsFields.restoLocation],
        // restoName: json[ProductsFields.restoName],
        // restoTable: json[ProductsFields.restoTable],
        // restoEmploye: json[ProductsFields.restoEmploye],
        // products: json[ProductsFields.products],
        ownerName: json["ownerName"],
        restoLocation: json["restoLocation"],
        restoName: json["restoName"],
        restoTable: json["restoTable"],
        restoEmploye: RestoEmploye.fromJson(json["restoEmploye"]),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ownerEmail": ownerEmail,
        "ownerName": ownerName,
        "restoLocation": restoLocation,
        "restoName": restoName,
        "restoTable": restoTable,
        "restoEmploye": restoEmploye!.toJson(),
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  const Product({
    this.food,
    this.drink,
    this.dessert,
  });

  final List<Dessert>? food;
  final List<Dessert>? drink;
  final List<Dessert>? dessert;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        food: List<Dessert>.from(json["food"].map((x) => Dessert.fromJson(x))),
        drink:
            List<Dessert>.from(json["drink"].map((x) => Dessert.fromJson(x))),
        dessert:
            List<Dessert>.from(json["dessert"].map((x) => Dessert.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "food": List<dynamic>.from(food!.map((x) => x.toJson())),
        "drink": List<dynamic>.from(drink!.map((x) => x.toJson())),
        "dessert": List<dynamic>.from(dessert!.map((x) => x.toJson())),
      };
}

class Dessert {
  const Dessert({
    this.foodName,
    this.foodPrice,
  });

  final String? foodName;
  final String? foodPrice;

  factory Dessert.fromJson(Map<String, dynamic> json) => Dessert(
        foodName: json["foodName"],
        foodPrice: json["foodPrice"],
      );

  Map<String, dynamic> toJson() => {
        "foodName": foodName,
        "foodPrice": foodPrice,
      };
}

class RestoEmploye {
  const RestoEmploye({
    this.kitchen,
    this.barista,
    this.waiters1,
    this.waiters2,
  });

  final String? kitchen;
  final String? barista;
  final String? waiters1;
  final String? waiters2;

  factory RestoEmploye.fromJson(Map<String, dynamic> json) => RestoEmploye(
        kitchen: json["kitchen"],
        barista: json["barista"],
        waiters1: json["waiters1"],
        waiters2: json["waiters2"],
      );

  Map<String, dynamic> toJson() => {
        "kitchen": kitchen,
        "barista": barista,
        "waiters1": waiters1,
        "waiters2": waiters2,
      };
}

/// PRODUCTS FILEDS

class ProductsFields {
  static const String ownerEmail = "ownerEmail";
  static const String ownerName = "ownerName";
  static const String restoLocation = "restoLocation";
  static const String restoName = "restoName";
  static const String restoTable = "restoTable";
  static const String restoEmploye = "restoEmploye";
  static const String products = "products";
}
