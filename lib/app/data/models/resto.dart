// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

// import 'dart:convert';

import 'package:casso/app/data/models/products.dart';

// RestosModel restoFromJson(String str) => RestosModel.fromJson(json.decode(str));

// String restoToJson(RestosModel data) => json.encode(data.toJson());

class RestosModel {
  const RestosModel({
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
  final List<dynamic>? restoEmploye;
  final Products? products;

  factory RestosModel.fromJson(Map<String, dynamic> json) => RestosModel(
        ownerEmail: json[RestoFields.ownerEmail],
        ownerName: json[RestoFields.ownerName],
        restoLocation: json[RestoFields.restoLocation],
        restoName: json[RestoFields.restoName],
        restoTable: json[RestoFields.restoTable],
        restoEmploye: json[RestoFields.restoEmploye],
        products: Products.fromJson(json[RestoFields.products]),
      );

  Map<String, dynamic> toJson() => {
        RestoFields.ownerEmail: ownerEmail,
        RestoFields.ownerName: ownerName,
        RestoFields.restoLocation: restoLocation,
        RestoFields.restoName: restoName,
        RestoFields.restoTable: restoTable,
        "restoEmploye":
            List<dynamic>.from(restoEmploye!.map((x) => x.toJson())),
        RestoFields.products: products!.toJson(),
      };
}

/// PRODUCTS FILEDS

class RestoFields {
  static const String ownerEmail = "ownerEmail";
  static const String ownerName = "ownerName";
  static const String restoName = "restoName";
  static const String restoLocation = "restoLocation";
  static const String restoTable = "restoTable";
  static const String restoEmploye = "restoEmploye";
  static const String products = "products";
}
