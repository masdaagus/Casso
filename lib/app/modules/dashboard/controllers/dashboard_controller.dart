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
  double totalPenjualan = 0;

  Future<void> initData() async {
    CollectionReference orderHistoryCollection = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("ordersDone");
    QuerySnapshot querySnapshot = await orderHistoryCollection.get();
    List<Order> listOrder = querySnapshot.docs.map((doc) {
      var object = doc.data() as Map<String, dynamic>;
      Order data = Order.fromJson(object);
      return data;
    }).toList();

    orderHistories = listOrder;
    totalSales();

    print(totalPenjualan);
  }

  double totalSales() {
    totalPenjualan = 0;
    orderHistories.forEach((data) {
      totalPenjualan += data.totalPrices!;
    });

    update();
    return totalPenjualan;
  }

  @override
  void onInit() async {
    user = auth.user;
    resto = auth.resto;
    await initData();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
