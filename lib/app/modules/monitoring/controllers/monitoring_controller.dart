import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MonitoringController extends GetxController {
  final auth = Get.find<AuthController>();
  var user = UsersModel().obs;
  var order = Order().obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> pesananStream() {
    final data = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("pesanan")
        .snapshots();

    return data;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> prosesStream() {
    final data = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("proses")
        .snapshots();

    return data;
  }

  Future<void> setProsesAll(Order data, String id) async {
    CollectionReference prosesC = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("proses");
    CollectionReference pesananC = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("pesanan");

    try {
      prosesC.doc(id).set(Order(
            guessName: data.guessName,
            tableNumber: data.tableNumber,
            waitersName: data.waitersName,
            totalPrices: data.totalPrices,
            totalItems: data.totalItems,
            productsOrder: data.productsOrder,
          ).toJson());

      pesananC.doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    CollectionReference prosesC = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("proses");
    prosesC.doc(id).delete();
  }

  Future<void> setProses(Order data, String id, List<ProductOrder> products,
      ProductOrder product) async {
    CollectionReference prosesC = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("proses");
    CollectionReference pesananC = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection("pesanan");

    try {
      final checkDoc = await prosesC.doc(id).get();

      if (checkDoc.data() == null) {
        print("SET");
        await prosesC.doc(id).set(Order(
              guessName: data.guessName,
              tableNumber: data.tableNumber,
              waitersName: data.waitersName,
              totalPrices: data.totalPrices,
              totalItems: data.totalItems,
              productsOrder: products,
            ).toJson());

        data.productsOrder!.remove(product);

        pesananC.doc(id).update(Order(
              guessName: data.guessName,
              tableNumber: data.tableNumber,
              waitersName: data.waitersName,
              totalPrices: data.totalPrices,
              totalItems: data.totalItems,
              productsOrder: data.productsOrder,
            ).toJson());
        // pesananC.doc(id).update({
        //   "productsOrder": data.productsOrder,
        // });

        pesananC.doc(id).update({
          "productsOrder": List<dynamic>.from(
            data.productsOrder!.map(
              (x) => x.toJson(),
            ),
          ),
        });
      } else {
        print("UPDATE");
        prosesC.doc(id).update(Order(
              guessName: data.guessName,
              tableNumber: data.tableNumber,
              waitersName: data.waitersName,
              totalPrices: data.totalPrices,
              totalItems: data.totalItems,
              productsOrder: products,
            ).toJson());

        data.productsOrder!.remove(product);

        pesananC.doc(id).update({
          "productsOrder": List<dynamic>.from(
            data.productsOrder!.map(
              (x) => x.toJson(),
            ),
          ),
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() async {
    user = auth.user;
    await pesananStream();
    await prosesStream();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.dispose();
  }
}
