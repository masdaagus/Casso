import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

class Order {
  Order({
    this.orderNumber,
    this.guessName,
    this.waitersName,
    this.tableNumber,
    this.totalItems,
    this.createAt,
    this.totalPrices,
    this.productsOrder,
  });
  final int? orderNumber;
  final String? guessName;
  final String? waitersName;
  final int? tableNumber;
  final int? totalItems;
  final String? createAt;
  double? totalPrices;
  List<ProductOrder>? productsOrder;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderNumber: json["orderNumber"],
        guessName: json["guessName"],
        waitersName: json["waitersName"],
        tableNumber: json["tableNumbers"],
        totalItems: json["totalItems"],
        createAt: json["createAt"],
        totalPrices: json["totalPrices"],
        productsOrder: List<ProductOrder>.from(
            json["productsOrder"].map((x) => ProductOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orderNumber": orderNumber,
        "guessName": guessName,
        "waitersName": waitersName,
        "tableNumbers": tableNumber,
        "totalItems": totalItems,
        "totalPrices": totalPrices,
        "createAt": createAt,
        "productsOrder":
            List<dynamic>.from(productsOrder!.map((x) => x.toJson())),
      };
}

class ProductOrder {
  ProductOrder({
    this.productName,
    this.productPrice,
    this.productCategory,
    this.productQty = 0,
  });
  String? productName;
  String? productCategory;
  double? productPrice;
  int productQty;

  factory ProductOrder.fromJson(Map<String, dynamic> json) => ProductOrder(
        productName: json["productName"],
        productPrice: json["productPrice"],
        productCategory: json["productCategory"],
        productQty: json["productQty"],
      );

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "productPrice": productPrice,
        "productCategory": productCategory,
        "productQty": productQty,
      };
}

// class OrderFields {
//   static const String guessName = "guessName";
//   static const String waitersName = "waitersName";
//   static const String tableNumbers = "tableNumbers";
//   static const String totalItems = "totalItems";
//   static const String totalPrices = "totalPrices";
//   static const String productsOrder = "productsOrder";
// }

// class POFields {
//   static const String productName = "productName";
//   static const String productPrice = "productPrice";
//   static const String productCategory = "productCategory";
//   static const String productQty = "productQty";
// }
