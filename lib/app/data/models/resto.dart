// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

// import 'dart:convert';
import 'package:casso/app/data/models/product.dart';
import 'package:casso/app/data/models/table.dart';
import 'package:casso/app/data/models/users.dart';

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
    this.tables,
    this.restoTaxes,
  });

  final int? restoTable;
  final String? ownerEmail;
  final String? ownerName;
  final String? restoLocation;
  final String? restoName;
  final double? restoTaxes;
  final List<dynamic>? products;
  final List<dynamic>? restoEmploye;
  final List<dynamic>? tables;

  // final Products? products;
  factory RestosModel.fromJson(Map<String, dynamic> json) => RestosModel(
        ownerEmail: json["ownerEmail"],
        ownerName: json["ownerName"],
        restoLocation: json["restoLocation"],
        restoName: json["restoName"],
        restoTable: json["restoTable"],
        restoTaxes: json["restoTaxes"],
        restoEmploye: List<dynamic>.from(
            json["restoEmploye"].map((x) => UsersModel.fromJson(x))),
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        tables: List<TableModel>.from(
            json["tables"].map((x) => TableModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ownerEmail": ownerEmail,
        "ownerName": ownerName,
        "restoLocation": restoLocation,
        "restoName": restoName,
        "restoTable": restoTable,
        "restoTaxes": restoTaxes,
        "restoEmploye":
            List<dynamic>.from(restoEmploye!.map((x) => x.toJson())),
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "tables": List<dynamic>.from(tables!.map((x) => x.toJson())),
      };
}





/// PRODUCTS FILEDS

// class RestoFields {
//   static const String ownerEmail = "ownerEmail";
//   static const String ownerName = "ownerName";
//   static const String restoName = "restoName";
//   static const String restoLocation = "restoLocation";
//   static const String restoTable = "restoTable";
//   static const String restoEmploye = "restoEmploye";
//   static const String products = "products";
// }
