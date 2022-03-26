import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MonitoringController extends GetxController {
  List<Map<String, dynamic>> listData = [
    {
      "table": 2,
      "guessName": "Masda",
      "timeOrder": "Baru aja",
      "orders": [
        "Milkshake Durian",
        "Nasi Goreng",
        "Kentang Goreng",
        "Ifumie",
      ]
    },
  ];

  final auth = Get.find<AuthController>();
  var user = UsersModel().obs;
  var order = Order().obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> getDataPesanan() async {
    // final pesananC = firestore
    //     .collection("restos")
    //     .doc(user.value.restoID)
    //     .collection("pesanan")
    //     .doc();
    final data =
        firestore.collection("restos").doc("lQi2rAuIGjYisbLK2Rr7").get();
    print(data);

    // final a = pesananC as Map<String, dynamic>;
    // print("guss name = ${a['guessName']}");
    // print(pesananC.);
    // print(a.data() as Map<String, dynamic>);

    // try {
    //   pesananC.add(Order(
    //     guessName: guessName,
    //     tableNumber: table + 1,
    //     waitersName: user.value.name,
    //     totalPrices: _sumPrices(),
    //     totalItems: _tempOrder.length,
    //     productsOrder: _tempOrder,
    //   ).toJson());
    // } catch (e) {
    //   print(e);
    // }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> orderStream() {
    final data = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("pesanan")
        .snapshots();

    return data;
  }

  @override
  void onInit() async {
    user = auth.user;
    await getDataPesanan;
    await orderStream();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
