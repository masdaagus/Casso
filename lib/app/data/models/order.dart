import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

class Order {
  Order({
    this.orderId,
    this.orderNumber,
    this.guessName,
    this.waitersName,
    this.tableNumber,
    this.createAt,
    this.totalPrices,
    this.productsOrder,
  });
  final String? orderId;
  final int? orderNumber;
  final String? guessName;
  final String? waitersName;
  final int? tableNumber;

  final String? createAt;
  double? totalPrices;
  List<ProductOrder>? productsOrder;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["orderId"],
        orderNumber: json["orderNumber"],
        guessName: json["guessName"],
        waitersName: json["waitersName"],
        tableNumber: json["tableNumbers"],
        // totalItems: json["totalItems"],
        createAt: json["createAt"],
        totalPrices: json["totalPrices"],
        productsOrder: List<ProductOrder>.from(
            json["productsOrder"].map((x) => ProductOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "orderNumber": orderNumber,
        "guessName": guessName,
        "waitersName": waitersName,
        "tableNumbers": tableNumber,
        // "totalItems": totalItems,
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
    this.productDescription,
    this.productQty = 0,
    this.productStock,
    this.productNote,
  });
  String? productName;
  String? productCategory;
  double? productPrice;
  String? productDescription;
  String? productNote;
  int? productStock;

  int productQty;

  factory ProductOrder.fromJson(Map<String, dynamic> json) => ProductOrder(
        productName: json["productName"],
        productPrice: json["productPrice"],
        productCategory: json["productCategory"],
        productQty: json["productQty"],
        productDescription: json["productDescription"],
        productStock: json["productStock"],
        productNote: json["productNote"],
      );

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "productPrice": productPrice,
        "productCategory": productCategory,
        "productQty": productQty,
        "productDescription": productDescription,
        "productStock": productStock,
        "productNote": productNote,
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
