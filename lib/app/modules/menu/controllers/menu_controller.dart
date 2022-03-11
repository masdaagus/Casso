import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/products.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  final auth = Get.find<AuthController>();
  var user = UsersModel().obs;
  var resto = RestosModel().obs;
  var order = Order().obs;

  List<ProductOrder> products = [];

  List<ProductOrder> food = [];
  List<ProductOrder> drink = [];
  List<ProductOrder> dessert = [];

  Future<void> _getAllProducts() async {
    var foodData = resto.value.products!.food as List<ProductCategory>;
    var drinkData = resto.value.products!.drink as List<ProductCategory>;
    var dessertData = resto.value.products!.dessert as List<ProductCategory>;

    foodData.forEach((data) {
      products.add(ProductOrder(
        productName: data.foodName,
        productPrice: data.foodPrice,
        productQty: 0,
      ));
      food.add(ProductOrder(
        productName: data.foodName,
        productPrice: data.foodPrice,
        productQty: 0,
      ));
    });
    drinkData.forEach((data) {
      products.add(ProductOrder(
        productName: data.foodName,
        productPrice: data.foodPrice,
        productQty: 0,
      ));
      drink.add(ProductOrder(
        productName: data.foodName,
        productPrice: data.foodPrice,
        productQty: 0,
      ));
    });
    dessertData.forEach((data) {
      products.add(ProductOrder(
        productName: data.foodName,
        productPrice: data.foodPrice,
        productQty: 0,
      ));
      dessert.add(ProductOrder(
        productName: data.foodName,
        productPrice: data.foodPrice,
        productQty: 0,
      ));
    });
  }

  @override
  void onInit() async {
    user = auth.user;
    resto = auth.resto;
    await _getAllProducts();

    super.onInit();
  }

  @override
  void onClose() {}
}
