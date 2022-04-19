import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final auth = Get.find<AuthController>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var user = UsersModel().obs;
  var resto = RestosModel().obs;

  List<Order> orderHistories = [];
  RxDouble totalPenjualan = 0.0.obs;
  String bestProductName = '';
  ProductOrder nullData = ProductOrder();
  ProductOrder? bestNo1;
  ProductOrder? bestNo2;
  ProductOrder? bestNo3;

  Future<void> initData() async {
    CollectionReference orderHistoryCollection = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("orders");
    QuerySnapshot querySnapshot =
        await orderHistoryCollection.where('isPaid', isEqualTo: true).get();
    List<Order> listOrder = querySnapshot.docs.map((doc) {
      var object = doc.data() as Map<String, dynamic>;
      Order data = Order.fromJson(object);
      return data;
    }).toList();

    orderHistories = listOrder;
    totalSales();
  }

  RxDouble totalSales() {
    totalPenjualan = 0.0.obs;
    orderHistories.forEach((data) {
      totalPenjualan.value += data.totalPrices!;
    });

    update();
    return totalPenjualan;
  }

  Future<void> getBestProduct() async {
    final ids = Set();

    List<ProductOrder> soldProducts = [];
    List<ProductOrder> filterBestProduct = [];

    orderHistories.forEach((data) {
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

    bestProducts.forEach((data) {
      print("${data.productName} ${data.productQty}");
    });

    bestNo1 = bestProducts[0];
    bestNo2 = bestProducts[1];
    bestNo3 = bestProducts[2];

    bestProductName = bestProducts[0].productName!;
  }

  @override
  void onInit() async {
    user = auth.user;
    resto = auth.resto;
    await initData();
    await getBestProduct();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
