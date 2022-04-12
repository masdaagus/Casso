import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/deleted_order.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/table.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CashierController extends GetxController {
  final auth = Get.find<AuthController>();
  var user = UsersModel().obs;
  var resto = RestosModel().obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DateTime now = DateTime.now();

  late TextEditingController deleteReason;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamOrdersPaid() {
    final data = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection('orders')
        // .orderBy('isPaid' == true, descending: true)
        .where('isPaid', isEqualTo: true)
        .snapshots();

    return data;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamOrdersUnPaid() {
    final data = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection('orders')
        .where('isPaid', isEqualTo: false)
        .snapshots();

    return data;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamOrders(bool paid) {
    final data = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection('orders')
        // .orderBy('isPaid' == true, descending: true)
        .where('isPaid', isEqualTo: paid)
        .snapshots();

    return data;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamOrdersDeleted() {
    final data = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection('orders-deleted')
        .snapshots();

    return data;
  }

  // Future<void> setPaid(Order data) async {
  //   CollectionReference ordersCollection = firestore
  //       .collection("restos")
  //       .doc(user.value.restoID)
  //       .collection('orders');

  //   CollectionReference restos = firestore.collection("restos");
  //   double tax = resto.value.restoTaxes!;

  //   try {
  //     var updateTotalPrices =
  //         (data.totalPrices! * tax / 100) + data.totalPrices!;
  //     await ordersCollection.doc(data.orderId).update({
  //       "isPaid": true,
  //       "totalPrices": updateTotalPrices,
  //     });

  //     final List<TableModel> tables = resto.value.tables! as List<TableModel>;
  //     tables[data.tableNumber! - 1].guessName = null;
  //     await restos.doc(user.value.restoID).update({
  //       "tables": List<dynamic>.from(
  //         tables.map(
  //           (x) => x.toJson(),
  //         ),
  //       )
  //     });

  //     final restoId = await restos.doc(user.value.restoID).get();
  //     final restoData = restoId.data() as Map<String, dynamic>;
  //     resto(RestosModel.fromJson(restoData));
  //     auth.refresh();
  //     update();
  //     Get.back();
  //     Get.back();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> deleteOrder(Order data) async {
    CollectionReference ordersCollection = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection('orders');
    CollectionReference deletedOrdersCollection = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection('orders-deleted');

    CollectionReference restos = firestore.collection("restos");
    double tax = resto.value.restoTaxes!;

    try {
      await deletedOrdersCollection.doc(data.orderId).set(DeletedOrder(
            deleteReason: 'alasan di hapus adalah',
            deletedAt: now.toIso8601String(),
            order: data,
          ).toJson());
      // var updateTotalPrices =
      //     (data.totalPrices! * tax / 100) + data.totalPrices!;

      // await ordersCollection.doc(data.orderId).update({
      //   "isPaid": true,
      //   "totalPrices": updateTotalPrices,
      // });

      // final List<TableModel> tables = resto.value.tables! as List<TableModel>;
      // tables[data.tableNumber! - 1].guessName = null;
      // await restos.doc(user.value.restoID).update({
      //   "tables": List<dynamic>.from(
      //     tables.map(
      //       (x) => x.toJson(),
      //     ),
      //   )
      // });

      // final restoId = await restos.doc(user.value.restoID).get();
      // final restoData = restoId.data() as Map<String, dynamic>;
      // resto(RestosModel.fromJson(restoData));
      // auth.refresh();
      // update();
      Get.back();
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  // Future<void> deleteDataIfInTime() async {
  //   CollectionReference historyCollection = firestore
  //       .collection("restos")
  //       .doc(user.value.restoID)
  //       .collection('ordersDone');

  //   if (now.hour == 2) {
  //     print('delete data di sini');

  //     QuerySnapshot querySnapshot = await historyCollection.get();

  //     querySnapshot.docs.map((doc) {
  //       historyCollection.doc(doc.id).delete();
  //     }).toList();
  //   } else {
  //     print('enggak');
  //   }
  // }

  // Future<void> setHistory(Order data) async {
  //   print('SET OrderHistory');
  //   CollectionReference historyCollection = firestore
  //       .collection("restos")
  //       .doc(user.value.restoID)
  //       .collection('ordersDone');
  //   CollectionReference ordersCollection = firestore
  //       .collection("restos")
  //       .doc(user.value.restoID)
  //       .collection('orders');

  //   CollectionReference restos = firestore.collection("restos");

  //   try {
  //     await historyCollection
  //         .doc(data.orderId)
  //         .set(Order(
  //           orderId: data.orderId,
  //           guessName: data.guessName,
  //           tableNumber: data.tableNumber,
  //           waitersName: data.waitersName,
  //           totalPrices: data.totalPrices,
  //           productsOrder: data.productsOrder,
  //           createAt: now.toIso8601String(),
  //           orderNumber: 1,
  //         ).toJson())
  //         .then((value) async {
  //       try {
  //         final checkResto = await restos.doc(user.value.restoID).get();
  //         var dataResto = checkResto.data() as Map<String, dynamic>;
  //         List<TableModel> tables = List<TableModel>.from(
  //             dataResto["tables"].map((x) => TableModel.fromJson(x)));

  //         tables[data.tableNumber! - 1].guessName = null;
  //         await restos.doc(user.value.restoID).update({
  //           "tables": List<dynamic>.from(
  //             tables.map(
  //               (x) => x.toJson(),
  //             ),
  //           ),
  //         });
  //       } catch (e) {}

  //       ordersCollection.doc(data.orderId).delete();
  //       Get.off(
  //         () => HomeView(),
  //         transition: Transition.fade,
  //         duration: Duration(milliseconds: 1000),
  //       );
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void onInit() async {
    user = auth.user;
    resto = auth.resto;
    await streamOrdersPaid();
    await streamOrdersUnPaid();

    super.onInit();
  }

  // @override
  // void onReady() async {
  // TODO: implement onReady
  // await deleteDataIfInTime();
  //   super.onReady();
  // }

  @override
  void onClose() {
    super.dispose();
  }
}
