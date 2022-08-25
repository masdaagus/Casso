import 'package:casso/app/data/model/product_model.dart';

class TransactionModel {
  TransactionModel({
    this.id,
    this.transactionId,
    this.createAt,
    this.totalPrices,
    this.productsTransaction,
  });
  final int? id;
  final String? transactionId;
  final String? createAt;
  double? totalPrices;
  List<ProductModel>? productsTransaction;

  TransactionModel copyWith({
    int? id,
    String? transactionID,
    String? createAT,
    double? totalPrices,
    List<ProductModel>? productsTransaction,
  }) =>
      TransactionModel(
        id: id ?? this.id,
        transactionId: transactionID ?? this.transactionId,
        createAt: createAT ?? this.createAt,
        totalPrices: totalPrices ?? this.totalPrices,
        productsTransaction: productsTransaction ?? null,
      );

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json['id'],
        transactionId: json["transactionId"],
        createAt: json["createAt"],
        totalPrices: json["totalPrices"],
        productsTransaction: json['productsTransaction'] == 'null'
            ? <ProductModel>[]
            : List<ProductModel>.from(json["productsTransaction"]
                .map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transactionId": transactionId,
        "totalPrices": totalPrices,
        "createAt": createAt,
        "productsTransaction": productsTransaction?.length != 0
            ? List<dynamic>.from(productsTransaction!.map((x) => x.toJson()))
            : 'null',
      };
}
