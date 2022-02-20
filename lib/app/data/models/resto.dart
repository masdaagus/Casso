// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

import 'package:casso/app/data/models/products.dart';
import 'package:casso/app/data/models/users.dart';

Resto restoFromJson(String str) => Resto.fromJson(json.decode(str));

String restoToJson(Resto data) => json.encode(data.toJson());

class Resto {
  const Resto({
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
  final List<UsersModel>? restoEmploye;
  final List<Products>? products;

  factory Resto.fromJson(Map<String, dynamic> json) => Resto(
        ownerEmail: json[RestoFields.ownerEmail],
        ownerName: json[RestoFields.ownerName],
        restoLocation: json[RestoFields.restoLocation],
        restoName: json[RestoFields.restoName],
        restoTable: json[RestoFields.restoTable],
        restoEmploye: json[RestoFields.restoEmploye],
        products: List<Products>.from(
            json[RestoFields.products].map((x) => Products.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        RestoFields.ownerEmail: ownerEmail,
        RestoFields.ownerName: ownerName,
        RestoFields.restoLocation: restoLocation,
        RestoFields.restoName: restoName,
        RestoFields.restoTable: restoTable,
        RestoFields.restoEmploye:
            List<dynamic>.from(restoEmploye!.map((x) => x.toJson)),
        RestoFields.products:
            List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

// class RestoEmploye {
//   const RestoEmploye({
//     this.name,
//     this.password,
//     this.status,
//     this.restoID,
//   });

//   final String? name;
//   final String? password;
//   final String? status;
//   final String? restoID;

//   factory RestoEmploye.fromJson(Map<String, dynamic> json) => RestoEmploye(
//         name: json["name"],
//         password: json["password"],
//         status: json["status"],
//         restoID: json["restoID"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "password": password,
//         "status": status,
//         "restoID": restoID,
//       };
// }

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
