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

  void getDataPesanan() async {
    final data = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("pesanan")
        .snapshots();
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
