import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final auth = Get.find<AuthController>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var user = UsersModel().obs;
  var resto = RestosModel().obs;

  bool isLoading = false;

  final now = DateTime.now();

  ProductOrder nullData = ProductOrder();

  List<Order>? orderHistories;
  RxDouble totalPenjualan = 0.0.obs;
  ProductOrder? bestNo1;
  ProductOrder? bestNo2;
  ProductOrder? bestNo3;
  String? ringkasan;
  String? _month;

  List<Order> ordersToday = [];
  List<Order> ordersWeekly = [];
  List<Order> ordersMonthly = [];

  String _getMonth() {
    switch (now.month) {
      case 1:
        _month = 'Januari';
        break;

      case 2:
        _month = 'Februari';
        break;

      case 3:
        _month = 'Maret';
        break;

      case 4:
        _month = 'April';
        break;

      case 5:
        _month = 'Mei';
        break;

      case 6:
        _month = 'Juni';
        break;

      case 7:
        _month = 'Juli';
        break;

      case 8:
        _month = 'Agustus';
        break;

      case 9:
        _month = 'September';
        break;

      case 10:
        _month = 'Oktober';
        break;

      case 11:
        _month = 'November';
        break;

      case 12:
        _month = 'Desember';
        break;
    }

    return _month!;
  }

  Future<void> getTodayHistories() async {
    isLoading = true;
    update();

    if (ordersToday.length == 0) {
      await initData();
    }

    orderHistories = ordersToday;
    _getBestProduct();
    ringkasan =
        now.day.toString() + ' ' + _getMonth() + ' ' + now.year.toString();
    isLoading = false;

    update();
  }

  Future<void> getWeeklyHistories() async {
    isLoading = true;
    update();

    if (ordersWeekly.length == 0) {
      await _monthlyHistories();
    }
    orderHistories = ordersWeekly;
    _getBestProduct();

    int weekday = now.weekday;
    DateTime x = now.subtract(Duration(days: weekday));

    ringkasan =
        "${x.day}-${x.day + 6}" + ' ' + _getMonth() + ' ' + x.year.toString();
    isLoading = false;

    update();
  }

  Future<void> getMonthlyHistories() async {
    isLoading = true;
    update();
    if (ordersMonthly.length == 0) {
      await _monthlyHistories();
    }
    orderHistories = ordersMonthly;
    _getBestProduct();
    ringkasan = _getMonth() + ' ' + now.year.toString();

    isLoading = false;
    update();
  }

  // Future<void> _weeklyHistories() async {
  //   Query<Map<String, dynamic>> ordersHistoriesCollection = firestore
  //       .collection("restos")
  //       .doc(user.value.restoID)
  //       .collection("orders-histories")
  //       .limit(7);

  //   List<Order> historiesWeekly = [];
  //   historiesWeekly.addAll(ordersToday);

  //   var queryOrdersHistories = await ordersHistoriesCollection.get();

  //   queryOrdersHistories.docs.map((doc) {
  //     var obj = doc.data();
  //     Order data = Order.fromJson(obj);

  //     DateTime dataTime = DateTime.parse(data.createAt!);

  //     int weekday = now.weekday;
  //     DateTime firstDayOfWeek = now.subtract(Duration(days: weekday));

  //     if (dataTime.isAfter(firstDayOfWeek) &&
  //         dataTime.isBefore(firstDayOfWeek.add(Duration(days: 6)))) {
  //       historiesWeekly.add(data);
  //     }
  //   }).toList();

  //   ordersWeekly = historiesWeekly;

  //   update();
  // }

  Future<void> _monthlyHistories() async {
    // Query<Map<String, dynamic>> ordersHistoriesCollection = firestore
    //     .collection("restos")
    //     .doc(user.value.restoID)
    //     .collection("orders-histories")
    //     .limit(100);
    Query<Map<String, dynamic>> ordersHistoriesCollection = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("orders-histories")
        .orderBy('orderMonth')
        .endBefore([now.month + 1]);

    List<Order> historiesMonthly = [];
    List<Order> historiesWeekly = [];
    historiesWeekly.addAll(ordersToday);
    historiesMonthly.addAll(ordersToday);

    var queryOrdersHistories = await ordersHistoriesCollection.get();

    queryOrdersHistories.docs.map((doc) {
      var obj = doc.data();
      Order data = Order.fromJson(obj);

      DateTime dataTime = DateTime.parse(data.createAt!);

      int weekday = now.weekday;
      DateTime firstDayOfWeek = now.subtract(Duration(days: weekday));

      historiesMonthly.add(data);

      if (dataTime.isAfter(firstDayOfWeek) &&
          dataTime.isBefore(firstDayOfWeek.add(Duration(days: 6)))) {
        historiesWeekly.add(data);
      }
    }).toList();

    ordersMonthly = historiesMonthly;
    ordersWeekly = historiesWeekly;

    update();
  }

  Future<void> initData() async {
    CollectionReference ordersCollection = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("orders");

    QuerySnapshot querySnapshot =
        await ordersCollection.where('isPaid', isEqualTo: true).get();
    List<Order> listOrder = querySnapshot.docs.map((doc) {
      var object = doc.data() as Map<String, dynamic>;
      Order data = Order.fromJson(object);
      return data;
    }).toList();

    orderHistories = listOrder;
    ordersToday = listOrder;
    _totalSales();

    update();
  }

  Future<void> _getBestProduct() async {
    final ids = Set();

    List<ProductOrder> soldProducts = [];
    List<ProductOrder> filterBestProduct = [];

    orderHistories!.forEach((data) {
      soldProducts.addAll(data.productsOrder!);
    });

    soldProducts.forEach((data) {
      ProductOrder productOrder = ProductOrder(
        productName: data.productName,
        productPrice: data.productPrice,
        productQty: 0,
        productCategory: data.productCategory,
      );
      filterBestProduct.add(productOrder);
    });

    filterBestProduct.retainWhere(
      (x) => ids.add(x.productName),
    );
    filterBestProduct.forEach((dataA) {
      soldProducts.forEach((dataB) {
        if (dataA.productName == dataB.productName &&
            dataA.productPrice == dataB.productPrice) {
          dataA.productQty += dataB.productQty;
        }
      });
    });

    List<ProductOrder> bestProducts = filterBestProduct.toList()
      ..sort((a, b) => b.productQty.compareTo(a.productQty));

    bestNo1 = bestProducts[0];
    bestNo2 = bestProducts[1];
    bestNo3 = bestProducts[2];

    _totalSales();

    update();
  }

  RxDouble _totalSales() {
    totalPenjualan = 0.0.obs;
    orderHistories!.forEach((data) {
      totalPenjualan.value += data.totalPrices!;
    });
    return totalPenjualan;
  }

  @override
  void onInit() async {
    user = auth.user;
    resto = auth.resto;
    isLoading = true;
    await initData();
    _getBestProduct();
    ringkasan =
        now.day.toString() + ' ' + _getMonth() + ' ' + now.year.toString();
    isLoading = false;

    super.onInit();
  }

  @override
  void onReady() async {
    // Future.delayed(Duration(seconds: 3));
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
