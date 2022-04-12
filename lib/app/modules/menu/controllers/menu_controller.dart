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
  List<Order> listOrdersCollection = [];

  double _totalPrice = 0;

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
      // QuerySnapshot queryOrders = await orderCollection.get();

      // List<Order> listOrdersCollection = queryOrders.docs.map((doc) {
      //   var object = doc.data() as Map<String, dynamic>;
      //   final data = Order.fromJson(object);
      //   return data;
      // }).toList();

      int orderNumber = listOrdersCollection.length;

      // QuerySnapshot queryPesanan = await pesananC.get();

      // List<Order> _listOrder = queryPesanan.docs.map((doc) {
      //   var object = doc.data() as Map<String, dynamic>;
      //   final data = Order.fromJson(object);
      //   return data;
      // }).toList();

      double _total = 0;

      final ids = Set();
      _tempOrder.retainWhere(
        (x) => ids.add(x.productName),
      );

      _tempOrder.forEach((data) {
        _total += (data.productPrice! * data.productQty);
      });

      /// MENAMBAHKAN DATA KE COLLECTION PESANAN
      await pesananC
          .add(Order(
        guessName: guessName,
        tableNumber: table,
        waitersName: user.value.name,
        productsOrder: _tempOrder,
        totalPrices: _total,
        createAt: now.toIso8601String(),
        orderNumber: orderNumber,
      ).toJson())
          .then((obj) async {
        /// TAKE ALL DATA [ORDERS] COLLECTION
        // QuerySnapshot querySnapshot = await orderCollection.get();

        // VARIABLE YG NANTI AKAN DI ISI
        String? id;
        Order? order;

        listOrdersCollection.forEach((orderData) {
          if (orderData.guessName == guessName &&
              orderData.tableNumber == table) {
            id = orderData.orderId;
            order = orderData;
          }
        });

        /// GENERATE COLLECTIOSN [ORDERS] KE LIST ORDER
        // List<Order> _listOrdersCollection = querySnapshot.docs.map((doc) {
        //   var object = doc.data() as Map<String, dynamic>;
        //   Order data = Order.fromJson(object);

        //   // APAKAH NAMA TAMU DAN NO MEJA ADA YG SAMA DI LIST ORDER
        //   // KALO SAMA VARIABLE YG DI ATAS DI INIT [JADINYA KAN GAK KOSONG]
        //   if (data.guessName == guessName && data.tableNumber == table) {
        //     id = doc.id;
        //     order = data;
        //   }

        //   return data;
        // }).toList();

        /// CEK APAKAH DATA ORDER ADA DI COLLECTION [ORDERS]
        if (id != null && order != null && order!.isPaid == false) {
          print('UPDATE DATA');

          /// MEMASUKKAN DATA PRODUCT DARI VARIABLE ORDER
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
            "orderNumber": listOrdersCollection.length + 1,
          });
        } else {
          print('SET DATA BARU');

          await orderCollection.doc(obj.id).set(Order(
                orderId: obj.id,
                guessName: guessName,
                tableNumber: table,
                waitersName: user.value.name,
                productsOrder: _tempOrder,
                totalPrices: _total,
                createAt: now.toIso8601String(),
                orderNumber: null,
                isPaid: false,
              ).toJson());

          /// UPDATE ID
          await pesananC.doc(obj.id).update({
            "orderId": obj.id,
            "orderNumber": listOrdersCollection.length + 1,
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
  void onReady() async {
    await _initQueryOrders();
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {}
}
