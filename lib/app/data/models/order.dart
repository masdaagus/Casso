// class Order {
//   Order({
//     this.orderId,
//     this.orderNumber,
//     this.guessName,
//     this.waitersName,
//     this.tableNumber,
//     this.createAt,
//     this.totalPrices,
//     this.productsOrder,
//     this.isPaid = false,
//     this.orderMonth,
//   });
//   final String? orderId;
//   final int? orderNumber;
//   final int? orderMonth;
//   final String? guessName;
//   final String? waitersName;
//   final int? tableNumber;
//   final String? createAt;
//   final bool? isPaid;

//   double? totalPrices;
//   List<ProductOrder>? productsOrder;

//   factory Order.fromJson(Map<String, dynamic> json) => Order(
//         orderId: json["orderId"],
//         orderNumber: json["orderNumber"],
//         orderMonth: json["orderMonth"],
//         guessName: json["guessName"],
//         waitersName: json["waitersName"],
//         tableNumber: json["tableNumbers"],
//         isPaid: json["isPaid"],
//         createAt: json["createAt"],
//         totalPrices: json["totalPrices"],
//         productsOrder: List<ProductOrder>.from(
//             json["productsOrder"].map((x) => ProductOrder.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "orderId": orderId,
//         "orderNumber": orderNumber,
//         "orderMonth": orderMonth,
//         "guessName": guessName,
//         "waitersName": waitersName,
//         "tableNumbers": tableNumber,
//         "isPaid": isPaid,
//         "totalPrices": totalPrices,
//         "createAt": createAt,
//         "productsOrder":
//             List<dynamic>.from(productsOrder!.map((x) => x.toJson())),
//       };
// }

// class ProductOrder {
//   ProductOrder({
//     this.productName,
//     this.productPrice,
//     this.productCategory,
//     // this.productDescription,
//     this.productQty = 0,
//     // this.productStock,
//     this.productNote,
//   });
//   String? productName;
//   String? productCategory;
//   double? productPrice;

//   String? productNote;

//   int productQty;

//   factory ProductOrder.fromJson(Map<String, dynamic> json) => ProductOrder(
//         productName: json["productName"],
//         productPrice: json["productPrice"],
//         productCategory: json["productCategory"],
//         productQty: json["productQty"],
//         // productDescription: json["productDescription"],
//         // productStock: json["productStock"],
//         productNote: json["productNote"],
//       );

//   Map<String, dynamic> toJson() => {
//         "productName": productName,
//         "productPrice": productPrice,
//         "productCategory": productCategory,
//         "productQty": productQty,
//         // "productDescription": productDescription,
//         // "productStock": productStock,
//         "productNote": productNote,
//       };
// }
