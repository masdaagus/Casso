import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/table.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:casso/app/modules/home/views/home_view.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CashierController extends GetxController {
  final auth = Get.find<AuthController>();
  var user = UsersModel().obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DateTime now = DateTime.now();

  Stream<QuerySnapshot<Map<String, dynamic>>> initStream(String collection) {
    final data = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection(collection)
        .orderBy('orderNumber', descending: true)
        .snapshots();

    return data;
  }

  Future<void> deleteDataIfInTime() async {
    CollectionReference historyCollection = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection('ordersDone');

    if (now.hour == 2) {
      print('delete data di sini');

      QuerySnapshot querySnapshot = await historyCollection.get();

      querySnapshot.docs.map((doc) {
        historyCollection.doc(doc.id).delete();
      }).toList();
    } else {
      print('enggak');
    }
  }

  Future<void> setHistory(Order data) async {
    print('SET OrderHistory');
    CollectionReference historyCollection = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection('ordersDone');
    CollectionReference ordersCollection = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection('orders');

    CollectionReference restos = firestore.collection("restos");

    try {
      historyCollection
          .doc(data.orderId)
          .set(Order(
            orderId: data.orderId,
            guessName: data.guessName,
            tableNumber: data.tableNumber,
            waitersName: data.waitersName,
            totalPrices: data.totalPrices,
            productsOrder: data.productsOrder,
            createAt: now.toIso8601String(),
            orderNumber: 1,
          ).toJson())
          .then((value) async {
        try {
          final checkResto = await restos.doc(user.value.restoID).get();
          var dataResto = checkResto.data() as Map<String, dynamic>;
          List<TableModel> tables = List<TableModel>.from(
              dataResto["tables"].map((x) => TableModel.fromJson(x)));

          tables[data.tableNumber! - 1].guessName = null;
          await restos.doc(user.value.restoID).update({
            "tables": List<dynamic>.from(
              tables.map(
                (x) => x.toJson(),
              ),
            ),
          });
        } catch (e) {}

        ordersCollection.doc(data.orderId).delete();
        Get.off(
          () => HomeView(),
          transition: Transition.fade,
          duration: Duration(milliseconds: 1000),
        );
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() async {
    user = auth.user;
    await initStream('orders');
    await initStream('ordersDone');

    super.onInit();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    // await deleteDataIfInTime();
    super.onReady();
  }

  @override
  void onClose() {
    super.dispose();
  }
}
