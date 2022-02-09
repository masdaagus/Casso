// To parse this JSON data, do
//
//     final makanan = makananFromJson(jsonString);

import 'dart:convert';

Makanan makananFromJson(String str) => Makanan.fromJson(json.decode(str));

String makananToJson(Makanan data) => json.encode(data.toJson());

class Makanan {
  Makanan({this.namaItem, this.hargaItem, this.jumlahItem});

  String? namaItem;
  int? hargaItem;
  int? jumlahItem;

  factory Makanan.fromJson(Map<String, dynamic> json) => Makanan(
        namaItem: json["namaItem"],
        hargaItem: json["hargaItem"],
        jumlahItem: json["jumlahItem"],
      );

  Map<String, dynamic> toJson() => {
        "namaItem": namaItem,
        "hargaItem": hargaItem,
        "jumlahItem": jumlahItem,
      };
}
