import 'package:casso/app/controllers/auth_controller.dart';

import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/products.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/table.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  final auth = Get.find<AuthController>();
  var user = UsersModel().obs;
  var resto = RestosModel().obs;
  var order = Order().obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<ProductOrder> _tempOrder = [];

  List<ProductOrder> products = [];

  double _totalPrice = 0;

  Future<void> _getAllProducts() async {
    var foodData = resto.value.products!.food as List<ProductCategory>;
    var drinkData = resto.value.products!.drink as List<ProductCategory>;
    var dessertData = resto.value.products!.dessert as List<ProductCategory>;

    foodData.forEach((data) {
      products.add(ProductOrder(
        productName: data.foodName,
        productPrice: data.foodPrice,
        productQty: 0,
        productCategory: 'FOOD',
      ));
    });
    drinkData.forEach((data) {
      products.add(ProductOrder(
        productName: data.foodName,
        productPrice: data.foodPrice,
        productQty: 0,
        productCategory: 'DRINK',
      ));
    });
    dessertData.forEach((data) {
      products.add(ProductOrder(
        productName: data.foodName,
        productPrice: data.foodPrice,
        productQty: 0,
        productCategory: 'DESSERT',
      ));
    });

    order.value.productsOrder = _tempOrder;
    order.value.totalPrices = _totalPrice;
  }

  Future<void> addProduct(ProductOrder data) async {
    _tempOrder.add(data);
    data.productQty++;
    await _sumPrices();
    update();
  }

  Future<void> minProduct(ProductOrder data) async {
    _tempOrder.remove(data);
    data.productQty--;
    await _sumPrices();
    update();
  }

  Future<void> setOrder({String? guessName, int? table}) async {
    CollectionReference pesananC = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("pesanan");
    CollectionReference orderCollection = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("orders");

    DateTime now = DateTime.now();

    try {
      pesananC
          .add(Order(
        guessName: guessName,
        tableNumber: table,
        waitersName: user.value.name,
        totalPrices: _sumPrices(),
        totalItems: _tempOrder.length,
        productsOrder: _tempOrder,
        createAt: now.toIso8601String(),
        orderNumber: 1,
      ).toJson())
          .then((obj) async {
        QuerySnapshot querySnapshot = await orderCollection.get();

        String? id;
        Order? order;

        List<Order> ordersCollection = querySnapshot.docs.map((doc) {
          var object = doc.data() as Map<String, dynamic>;
          Order data = Order.fromJson(object);
          if (data.guessName == guessName && data.tableNumber == table) {
            id = doc.id;
            order = data;
          }
          return data;
        }).toList();

        if (id != null && order != null) {
          print('UPDATE DATA');

          List<ProductOrder> products = order!.productsOrder!;
          List<ProductOrder> productsEnd = [];

          products.forEach((dataA) {
            _tempOrder.forEach((dataB) {
              if (dataA.productName == dataB.productName &&
                  dataA.productPrice == dataB.productPrice) {
                print('samaaaaaa ni');
                print("data A = ${dataA.productName}");
                print("data B = ${dataB.productName}");
                dataA.productQty += 1;
                productsEnd.add(dataA);
              } else {
                productsEnd.addAll(products);
                productsEnd.add(dataB);
                print('gak sama');
              }
            });
          });
          final ids = Set();
          productsEnd.retainWhere(
            (x) => ids.add(x.productName),
          );

          orderCollection.doc(id).update({
            "productsOrder": List<dynamic>.from(
              productsEnd.map(
                (x) => x.toJson(),
              ),
            ),
          });
        } else {
          print('SET DATA BARU');
          final ids = Set();
          _tempOrder.retainWhere(
            (x) => ids.add(x.productName),
          );

          await orderCollection.doc(obj.id).set(Order(
                guessName: guessName,
                tableNumber: table,
                waitersName: user.value.name,
                totalPrices: _sumPrices(),
                totalItems: _tempOrder.length,
                productsOrder: _tempOrder,
                createAt: now.toIso8601String(),
                orderNumber: 1,
              ).toJson());
        }
      });
      Get.offAllNamed('/home');

      order.refresh();
    } catch (e) {
      print(e);
    }
  }

  double _sumPrices() {
    _totalPrice = 0;
    _tempOrder.forEach((order) => _totalPrice += order.productPrice!);
    order.update((val) {
      val!.totalPrices = _totalPrice;
    });

    return _totalPrice;
  }

  Future<void> deleteTable(int? tableNumber) async {
    CollectionReference restos = firestore.collection("restos");
    try {
      final checkResto = await restos.doc(user.value.restoID).get();
      var data = checkResto.data() as Map<String, dynamic>;
      List<TableModel> tables = List<TableModel>.from(
          data["tables"].map((x) => TableModel.fromJson(x)));

      tables[tableNumber! - 1].guessName = null;
      await restos.doc(user.value.restoID).update({
        "tables": List<dynamic>.from(
          tables.map(
            (x) => x.toJson(),
          ),
        ),
      });
    } catch (e) {
      print(e);
    }
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
