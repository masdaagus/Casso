import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CashierController extends GetxController {
  final auth = Get.find<AuthController>();
  var user = UsersModel().obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> initStream(String collection) {
    final data = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection(collection)
        .snapshots();

    return data;
  }

  @override
  void onInit() async {
    user = auth.user;
    await initStream('tersaji');
    super.onInit();
  }

  @override
  void onClose() {}
}
