// import 'dart:convert';

// UsersModel userModelFromJson(String str) =>
//     UsersModel.fromJson(json.decode(str));

// String userModelToJson(UsersModel data) => json.encode(data.toJson());

// class UsersModel {
//   const UsersModel({
//     this.name,
//     this.email,
//     this.status,
//     this.restoID,
//     this.uid,
//     this.password,
//   });

//   final String? name;
//   final String? email;
//   final String? status;
//   final String? restoID;
//   final String? uid;
//   final String? password;

//   factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
//         name: json["name"],
//         email: json["email"],
//         status: json["status"],
//         restoID: json["restoID"],
//         uid: json["uid"],
//         password: json["password"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "email": email,
//         "status": status,
//         "restoID": restoID,
//         "password": password,
//         "uid": uid,
//       };
// }
