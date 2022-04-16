class Product {
  const Product({
    this.productPrice,
    this.productCategory,
    this.productName,
    this.productStock = 100,
    this.productImage,
    this.productDescription,
  });
  final String? productName;
  final double? productPrice;
  final String? productCategory;
  final String? productDescription;
  final int? productStock;
  final String? productImage;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productName: json["productName"],
        productPrice: json["productPrice"],
        productCategory: json["productCategory"],
        productStock: json["productStock"],
        productDescription: json["productDescription"],
        productImage: json["productImage"],
      );

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "productPrice": productPrice,
        "productCategory": productCategory,
        "productStock": productStock,
        "productDescription": productDescription,
        "productImage": productImage,
      };
}
