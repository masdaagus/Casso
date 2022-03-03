class Products {
  const Products({
    this.food,
    this.drink,
    this.dessert,
  });

  final List<dynamic>? food;
  final List<dynamic>? drink;
  final List<dynamic>? dessert;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        food: List<ProductCategory>.from(
            json["food"].map((x) => ProductCategory.fromJson(x))),
        drink: List<ProductCategory>.from(
            json["drink"].map((x) => ProductCategory.fromJson(x))),
        dessert: List<ProductCategory>.from(
            json["dessert"].map((x) => ProductCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "food": List<dynamic>.from(food!.map((x) => x.toJson())),
        "drink": List<dynamic>.from(drink!.map((x) => x.toJson())),
        "dessert": List<dynamic>.from(dessert!.map((x) => x.toJson())),
      };
}

class ProductCategory {
  ProductCategory({
    this.foodName,
    this.foodPrice,
    this.foodCount = 0,
  });

  final String? foodName;
  final double? foodPrice;
  int? foodCount;
  // final String? productImage;
  // final int? stock;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        foodName: json["foodName"],
        foodPrice: json["foodPrice"],
      );

  Map<String, dynamic> toJson() => {
        "foodName": foodName,
        "foodPrice": foodPrice,
      };
}
