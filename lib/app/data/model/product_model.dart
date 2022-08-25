class ProductModel {
  ProductModel({
    this.id,
    this.productPrice,
    this.productCategory,
    this.productName,
    this.productImage,
    this.productQty = 0,
  });

  final int? id;
  final String? productName;
  final double? productPrice;
  final String? productCategory;
  int productQty;

  final String? productImage;

  ProductModel copyWith({
    final int? id,
    final String? productName,
    final double? productPrice,
    final String? productCategory,
    final int? productQty,
  }) =>
      ProductModel(
        id: id,
        productName: productName ?? this.productName,
        productPrice: productPrice ?? this.productPrice,
        productCategory: productCategory ?? this.productCategory,
        productQty: productQty ?? this.productQty,
        productImage: this.productImage,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        productName: json["productName"],
        productPrice: json["productPrice"],
        productCategory: json["productCategory"],
        productImage: json["productImage"],
        productQty: json["productQty"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "productPrice": productPrice,
        "productCategory": productCategory,
        "productImage": productImage,
        "productQty": productQty,
      };
}
