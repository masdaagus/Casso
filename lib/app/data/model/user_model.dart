import 'package:casso/app/data/model/product_model.dart';

class UserModel {
  const UserModel({
    this.name,
    this.email,
    this.uid,
    this.products,
  });

  final String? name;
  final String? email;
  final String? uid;

  final List<ProductModel>? products;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        uid: json["uid"],
        products: List<ProductModel>.from(
            json["products"].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "uid": uid,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}
