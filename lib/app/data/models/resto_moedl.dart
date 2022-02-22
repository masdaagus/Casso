// // To parse this JSON data, do
// //
// //     final restoModel = restoModelFromJson(jsonString);

// import 'dart:convert';

// RestoModel restoModelFromJson(String str) =>
//     RestoModel.fromJson(json.decode(str));

// String restoModelToJson(RestoModel data) => json.encode(data.toJson());

// class RestoModel {
//   RestoModel({
//     this.ownerEmail,
//     this.ownerName,
//     this.restoLocation,
//     this.restoName,
//     this.restoTable,
//     this.restoEmploye,
//     this.products,
//   });

//   String? ownerEmail;
//   String? ownerName;
//   String? restoLocation;
//   String? restoName;
//   String? restoTable;
//   List<RestoEmploye>? restoEmploye;
//   Products? products;

//   factory RestoModel.fromJson(Map<String, dynamic> json) => RestoModel(
//         ownerEmail: json["ownerEmail"],
//         ownerName: json["ownerName"],
//         restoLocation: json["restoLocation"],
//         restoName: json["restoName"],
//         restoTable: json["restoTable"],
//         restoEmploye: List<RestoEmploye>.from(
//             json["restoEmploye"].map((x) => RestoEmploye.fromJson(x))),
//         products: Products.fromJson(json["products"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "ownerEmail": ownerEmail,
//         "ownerName": ownerName,
//         "restoLocation": restoLocation,
//         "restoName": restoName,
//         "restoTable": restoTable,
//         "restoEmploye":
//             List<dynamic>.from(restoEmploye!.map((x) => x.toJson())),
//         "products": products!.toJson(),
//       };
// }

// class Products {
//   Products({
//     this.food,
//     this.drink,
//     this.dessert,
//   });

//   List<Dessert>? food;
//   List<Dessert>? drink;
//   List<Dessert>? dessert;

//   factory Products.fromJson(Map<String, dynamic> json) => Products(
//         food: List<Dessert>.from(json["food"].map((x) => Dessert.fromJson(x))),
//         drink:
//             List<Dessert>.from(json["drink"].map((x) => Dessert.fromJson(x))),
//         dessert:
//             List<Dessert>.from(json["dessert"].map((x) => Dessert.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "food": List<dynamic>.from(food!.map((x) => x.toJson())),
//         "drink": List<dynamic>.from(drink!.map((x) => x.toJson())),
//         "dessert": List<dynamic>.from(dessert!.map((x) => x.toJson())),
//       };
// }

// class Dessert {
//   Dessert({
//     this.foodName,
//     this.foodPrice,
//   });

//   String? foodName;
//   String? foodPrice;

//   factory Dessert.fromJson(Map<String, dynamic> json) => Dessert(
//         foodName: json["foodName"],
//         foodPrice: json["foodPrice"],
//       );

//   Map<String, dynamic> toJson() => {
//         "foodName": foodName,
//         "foodPrice": foodPrice,
//       };
// }

// class RestoEmploye {
//   RestoEmploye({
//     this.name,
//     this.password,
//     this.status,
//   });

//   String? name;
//   String? password;
//   String? status;

//   factory RestoEmploye.fromJson(Map<String, dynamic> json) => RestoEmploye(
//         name: json["name"],
//         password: json["password"],
//         status: json["status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "password": password,
//         "status": status,
//       };
// }
