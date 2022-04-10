import 'package:casso/app/controllers/auth_controller.dart';

import 'package:casso/app/data/models/order.dart';
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
    List<Product> productsData = resto.value.products! as List<Product>;

    productsData.forEach((p) {
      products.add(ProductOrder(
        productName: p.productName,
        productPrice: p.productPrice,
        productCategory: p.productCategory,
        productQty: 0,
        productDescription: p.productDescription,
        productStock: p.productStock,
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
      double _total = 0;

      _tempOrder.forEach((data) {
        _total += (data.productPrice! * data.productQty);
      });
      pesananC
          .add(Order(
        guessName: guessName,
        tableNumber: table,
        waitersName: user.value.name,
        productsOrder: _tempOrder,
        totalPrices: _total,
        createAt: now.toIso8601String(),
        orderNumber: 1,
      ).toJson())
          .then((obj) async {
        /// UPDATE ID
        pesananC.doc(obj.id).update({
          "orderId": obj.id,
        });

        QuerySnapshot querySnapshot = await orderCollection.get();

        String? id;
        Order? order;

        querySnapshot.docs.map((doc) {
          var object = doc.data() as Map<String, dynamic>;
          Order data = Order.fromJson(object);
          if (data.guessName == guessName && data.tableNumber == table) {
            id = doc.id;
            order = data;
          }
        }).toList();

        if (id != null && order != null) {
          print('UPDATE DATA');

          List<ProductOrder> products = order!.productsOrder!;
          List<ProductOrder> productsEnd = [];

          products.forEach((dataA) {
            _tempOrder.forEach((dataB) {
              if (dataA.productName == dataB.productName &&
                  dataA.productPrice == dataB.productPrice) {
                dataA.productQty += 1;
                productsEnd.add(dataA);
              } else {
                productsEnd.addAll(products);
                productsEnd.add(dataB);
              }
            });
          });
          final ids = Set();
          productsEnd.retainWhere(
            (x) => ids.add(x.productName),
          );
          double _total = 0;

          productsEnd.forEach((data) {
            _total += (data.productPrice! * data.productQty);
          });

          orderCollection.doc(id).update({
            "productsOrder": List<dynamic>.from(
              productsEnd.map(
                (x) => x.toJson(),
              ),
            ),
            "totalPrices": _total.toDouble(),
          });
        } else {
          print('SET DATA BARU');
          final ids = Set();
          _tempOrder.retainWhere(
            (x) => ids.add(x.productName),
          );

          double _total = 0;

          _tempOrder.forEach((data) {
            _total += (data.productPrice! * data.productQty);
          });

          await orderCollection.doc(obj.id).set(Order(
                orderId: obj.id,
                guessName: guessName,
                tableNumber: table,
                waitersName: user.value.name,
                productsOrder: _tempOrder,
                totalPrices: _total,
                createAt: now.toIso8601String(),
                orderNumber: 1,
              ).toJson());
        }
      });

      CollectionReference restos = firestore.collection("restos");
      final restoId = await restos.doc(user.value.restoID).get();
      final restoData = restoId.data() as Map<String, dynamic>;
      resto(RestosModel.fromJson(restoData));
      resto.refresh();
      auth.refresh();
      update();
      Get.offAllNamed('/home');
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

      final restoId = await restos.doc(user.value.restoID).get();
      final restoData = restoId.data() as Map<String, dynamic>;
      resto(RestosModel.fromJson(restoData));
      resto.refresh();
      auth.refresh();
      update();
    } catch (e) {
      print(e);
    }
  }

  List<String> image = [
    "assets/products/ayampenyet.jpg",
    "assets/products/bakso_bakar.jpeg",
    "assets/products/ikanbakar.jpg",
    "assets/products/kentang_goreng.jpeg",
    "assets/products/milkshakestroberi.jpg",
    "assets/products/nasigoreng.JPG",
    "assets/products/sanger.jpg",
    "assets/products/satetaichan.jpg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
    "assets/products/tehmanis.jpeg",
  ];
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
