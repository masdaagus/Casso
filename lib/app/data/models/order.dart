class Order {
  Order({
    this.guessName = 'NAMA TAMU',
    this.waitersName = 'NAMA WAITERS',
    this.tableNumber,
    this.totalItems = 0,
    this.totalPrices = 0,
    this.productsOrder,
  });
  final String? guessName;
  final String? waitersName;
  final int? tableNumber;
  final int? totalItems;
  double? totalPrices;
  List<ProductOrder>? productsOrder;
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
}
