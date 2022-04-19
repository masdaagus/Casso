import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/product.dart';
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

  List<ProductOrder> productsOrder = [];
  List<Product> products = [];
  List<Order> listOrdersCollection = [];

  List<Product> filteredProducts = [];

  double _totalPrice = 0;
  int _orderNumber = 0;

  final ids = Set();

  Future<List<Order>> _initQueryOrders() async {
    CollectionReference orderCollection = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("orders");

    try {
      QuerySnapshot queryOrders = await orderCollection.get();

      List<Order> getListOrdersCollection = queryOrders.docs.map((doc) {
        var object = doc.data() as Map<String, dynamic>;
        final data = Order.fromJson(object);
        return data;
      }).toList();

      listOrdersCollection = getListOrdersCollection;
    } catch (e) {
      print(e);
    }
    return listOrdersCollection;
  }

  Future<int> _collection() async {
    var psc = await firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("pesanan")
        .get();
    var prc = await firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("proses")
        .get();
    var spc = await firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("siap")
        .get();
    var trc = await firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("tersaji")
        .get();

    int _pesanan = psc.docs.length;
    int _proses = prc.docs.length;
    int _siap = spc.docs.length;
    int _tersaji = trc.docs.length;

    _orderNumber = 1 + (_pesanan + _proses + _siap + _tersaji);

    print(_orderNumber);
    return _orderNumber;
  }

  Future<void> _getAllProducts() async {
    List<Product> productsData = resto.value.products! as List<Product>;
    products = productsData;

    productsData.forEach((p) {
      productsOrder.add(ProductOrder(
        productQty: 0,
        productName: p.productName,
        productPrice: p.productPrice,
        productCategory: p.productCategory,
        productNote: null,
      ));
    });

    filteredProducts = products;

    order.value.productsOrder = productsOrder;
    order.value.totalPrices = _totalPrice;
  }

  Future<void> addProduct(ProductOrder data) async {
    data.productQty++;
    _totalCounter();

    productsOrder.forEach((d) {
      print("add = ${d.productName} ${d.productQty}");
    });

    update();
    // tempOrder.add(data);
    // await _sumPrices();
  }

  Future<void> minProduct(ProductOrder data) async {
    data.productQty--;
    _totalCounter();
    productsOrder.forEach((d) {
      print("min = ${d.productName} ${d.productQty}");
    });
    update();

    // tempOrder.remove(data);
    // await _sumPrices();
  }

  /// [FUNGSI SET ORDER]

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

      final finalOrder = productsOrder.where((d) => d.productQty != 0).toList();
      finalOrder.forEach((d) {
        _total += (d.productPrice! * d.productQty);
      });

      /// MENAMBAHKAN DATA KE COLLECTION PESANAN
      await pesananC
          .add(Order(
        guessName: guessName,
        tableNumber: table,
        waitersName: user.value.name,
        // productsOrder: tempOrder,
        productsOrder: finalOrder,
        totalPrices: _total,
        createAt: now.toIso8601String(),
        orderNumber: _orderNumber,
      ).toJson())
          .then((obj) async {
        // VARIABLE YG NANTI AKAN DI ISI
        String? id;
        Order? order;

        listOrdersCollection.forEach((orderC) {
          if (orderC.guessName == guessName && orderC.tableNumber == table) {
            id = orderC.orderId;
            order = orderC;
          }
        });

        /// CEK APAKAH DATA ORDER ADA DI COLLECTION [ORDERS]
        if (id != null && order != null && order!.isPaid == false) {
          print('UPDATE DATA');

          /// MEMASUKKAN DATA PRODUCT DARI VARIABLE ORDER
          List<ProductOrder> products = order!.productsOrder!;
          List<ProductOrder> productsEnd = [];

          products.forEach((dataA) {
            finalOrder.forEach((dataB) {
              if (dataA.productName == dataB.productName &&
                  dataA.productPrice == dataB.productPrice) {
                dataA.productQty += dataB.productQty;
                productsEnd.add(dataA);
              } else {
                productsEnd.addAll(products);
                productsEnd.add(dataB);
              }
            });
          });

          productsEnd.retainWhere(
            (x) => ids.add(x.productName),
          );
          double _total = 0;

          productsEnd.forEach((data) {
            _total += (data.productPrice! * data.productQty);
          });

          await orderCollection.doc(id).update({
            "productsOrder": List<dynamic>.from(
              productsEnd.map(
                (x) => x.toJson(),
              ),
            ),
            "totalPrices": _total.toDouble(),
          });

          /// UPDATE ID
          await pesananC.doc(obj.id).update({
            "orderId": obj.id,
          });
        } else {
          print('SET DATA BARU');

          await orderCollection.doc(obj.id).set(Order(
                orderId: obj.id,
                guessName: guessName,
                tableNumber: table,
                waitersName: user.value.name,
                productsOrder: finalOrder,
                totalPrices: _total,
                createAt: now.toIso8601String(),
                orderNumber: null,
                isPaid: false,
              ).toJson());

          /// UPDATE ID
          await pesananC.doc(obj.id).update({
            "orderId": obj.id,
          });
        }
      });

      CollectionReference restos = firestore.collection("restos");
      final restoDoc = await restos.doc(user.value.restoID).get();
      final restoData = restoDoc.data() as Map<String, dynamic>;
      resto(RestosModel.fromJson(restoData));
      resto.refresh();
      auth.refresh();
      update();
      Get.offAllNamed('/home');
    } catch (e) {
      print(e);
    }
  }

  double _totalCounter() {
    _totalPrice = 0;
    productsOrder.forEach((d) {
      if (d.productQty != 0) {
        _totalPrice += (d.productQty * d.productPrice!);
      }
    });
    order.update((val) {
      val!.totalPrices = _totalPrice;
    });
    update();
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

  void filterProducts(String data) {
    List<Product> result = [];
    update();
    if (data.isEmpty) {
      result = products;
    } else {
      var byName = products
          .where((d) => d.productName!.toLowerCase().contains(data))
          .toList();
      result = byName;
    }

    filteredProducts = result;
  }

  @override
  void onInit() async {
    user = auth.user;
    resto = auth.resto;
    await _getAllProducts();

    super.onInit();
  }

  @override
  void onReady() async {
    await _collection();
    await _initQueryOrders();

    super.onReady();
  }

  @override
  void onClose() {}
}
