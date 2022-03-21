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

  List<ProductOrder> tempOrder = [];
  // List<ProductOrder> food = [];
  // List<ProductOrder> drink = [];
  // List<ProductOrder> dessert = [];

  List<ProductOrder> products = [];

  double _totalPrice = 0;

  Future<void> _getAllProducts() async {
    var foodData = resto.value.products!.food as List<ProductCategory>;
    var drinkData = resto.value.products!.drink as List<ProductCategory>;
    var dessertData = resto.value.products!.dessert as List<ProductCategory>;

    foodData.forEach((data) {
      // food.add(ProductOrder(
      //   productName: data.foodName,
      //   productPrice: data.foodPrice,
      //   productQty: 0,
      //   productCategory: 'FOOD',
      // ));
      products.add(ProductOrder(
        productName: data.foodName,
        productPrice: data.foodPrice,
        productQty: 0,
        productCategory: 'FOOD',
      ));
    });
    drinkData.forEach((data) {
      // drink.add(ProductOrder(
      //   productName: data.foodName,
      //   productPrice: data.foodPrice,
      //   productQty: 0,
      //   productCategory: 'DRINK',
      // ));
      products.add(ProductOrder(
        productName: data.foodName,
        productPrice: data.foodPrice,
        productQty: 0,
        productCategory: 'DRINK',
      ));
    });
    dessertData.forEach((data) {
      // dessert.add(ProductOrder(
      //   productName: data.foodName,
      //   productPrice: data.foodPrice,
      //   productQty: 0,
      //   productCategory: 'DESSERT',
      // ));
      products.add(ProductOrder(
        productName: data.foodName,
        productPrice: data.foodPrice,
        productQty: 0,
        productCategory: 'DESSERT',
      ));
    });
  }

  Future<void> addProduct(ProductOrder data) async {
    data.productQty++;
    tempOrder.add(data);
    _sumPrices();
    update();
  }

  Future<void> minProduct(ProductOrder data) async {
    tempOrder.remove(data);
    data.productQty--;
    _sumPrices();
    update();
  }

  double _sumPrices() {
    _totalPrice = 0;
    tempOrder.forEach((order) => _totalPrice += order.productPrice!);
    order.update((val) {
      val!.totalPrices = _totalPrice;
    });

    return _totalPrice;
  }

  _orderInit() async {
    order.value.productsOrder = tempOrder;
    order.value.totalPrices = _totalPrice;
  }

  @override
  void onInit() async {
    user = auth.user;
    resto = auth.resto;
    await _getAllProducts();
    await _orderInit();

    super.onInit();
  }

  @override
  void onClose() {}
}
