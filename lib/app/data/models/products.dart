class Products {
  const Products({
    this.food,
    this.drink,
    this.dessert,
  });

  final List<ProductCategory>? food;
  final List<ProductCategory>? drink;
  final List<ProductCategory>? dessert;

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
  const ProductCategory({
    this.foodName,
    this.foodPrice,
  });

  final String? foodName;
  final String? foodPrice;

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
