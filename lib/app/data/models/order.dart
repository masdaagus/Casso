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
  final double? totalPrices;
  final List<ProductOrder>? productsOrder;
}

class ProductOrder {
  ProductOrder({
    this.productName,
    this.productPrice,
    required this.productQty,
  });
  String? productName;
  double? productPrice;
  int productQty;
}
