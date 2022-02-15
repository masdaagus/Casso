import 'dart:convert';

UsersModel userModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String userModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    this.name,
    this.email,
    this.status,
    this.createAt,
  });

  String? name;
  String? email;
  String? status;
  String? createAt;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        name: json["name"],
        email: json["email"],
        status: json["status"],
        createAt: json["createAt"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "status": status,
        "createAt": createAt,
      };
}
