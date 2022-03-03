import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/products.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  final auth = Get.find<AuthController>();
  var user = UsersModel().obs;

  var resto = RestosModel().obs;
  List<ProductCategory> allProducts = [];
  List<ProductCategory> tempOrder = [];

  void _getAllProducts() async {
    var food = resto.value.products!.food as List<ProductCategory>;
    var drink = resto.value.products!.drink as List<ProductCategory>;
    var dessert = resto.value.products!.dessert as List<ProductCategory>;

    food.forEach((element) {
      allProducts.add(ProductCategory(
        foodName: element.foodName,
        foodPrice: element.foodPrice,
      ));
    });
    drink.forEach((element) {
      allProducts.add(ProductCategory(
        foodName: element.foodName,
        foodPrice: element.foodPrice,
      ));
    });
    dessert.forEach((element) {
      allProducts.add(ProductCategory(
        foodName: element.foodName,
        foodPrice: element.foodPrice,
      ));
    });

    print(allProducts.length);
  }

  @override
  void onInit() {
    user = auth.user;
    resto = auth.resto;
    _getAllProducts();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
