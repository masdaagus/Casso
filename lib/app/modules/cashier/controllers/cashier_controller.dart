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

  TextEditingController? deleteReason;

  // Stream<QuerySnapshot<Map<String, dynamic>>> streamOrdersPaid() {
  //   final data = firestore
  //       .collection("restos")
  //       .doc(user.value.restoID)
  //       .collection('orders')
  //       // .orderBy('isPaid' == true, descending: true)
  //       .where('isPaid', isEqualTo: true)
  //       .snapshots();

  //   return data;
  // }

  // Stream<QuerySnapshot<Map<String, dynamic>>> streamOrdersUnPaid() {
  //   final data = firestore
  //       .collection("restos")
  //       .doc(user.value.restoID)
  //       .collection('orders')
  //       .where('isPaid', isEqualTo: false)
  //       .snapshots();

  //   return data;
  // }

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

  Future<void> setPaid(Order data) async {
    CollectionReference ordersCollection = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection('orders');

    CollectionReference restos = firestore.collection("restos");
    double tax = resto.value.restoTaxes!;

    try {
      double updateTotalPrices =
          (data.totalPrices! * tax / 100) + data.totalPrices!;
      await ordersCollection.doc(data.orderId).update({
        "isPaid": true,
        "totalPrices": updateTotalPrices,
      });

      final List<TableModel> tables = resto.value.tables! as List<TableModel>;
      tables[data.tableNumber! - 1].guessName = null;
      await restos.doc(user.value.restoID).update({
        "tables": List<dynamic>.from(
          tables.map(
            (x) => x.toJson(),
          ),
        )
      });

      final restoId = await restos.doc(user.value.restoID).get();
      final restoData = restoId.data() as Map<String, dynamic>;
      resto(RestosModel.fromJson(restoData));
      auth.refresh();
      update();
    } catch (e) {
      print(e);
    }
  }

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

    // double tax = resto.value.restoTaxes!;

    // double? updateTotalPrices;

    // if (tax != 0) {
    //   updateTotalPrices = (data.totalPrices! * tax / 100) + data.totalPrices!;
    // }

    try {
      await deletedOrdersCollection
          .doc(data.orderId)
          .set(DeletedOrder(
            deleteReason: deleteReason!.text,
            deletedAt: now.toIso8601String(),
            order: data,
          ).toJson())
          .then((value) async {
        await ordersCollection.doc(data.orderId).delete();

        final List<TableModel> tables = resto.value.tables! as List<TableModel>;
        tables[data.tableNumber! - 1].guessName = null;
        await restos.doc(user.value.restoID).update({
          "tables": List<dynamic>.from(
            tables.map(
              (x) => x.toJson(),
            ),
          )
        });
      });

      final restoId = await restos.doc(user.value.restoID).get();
      final restoData = restoId.data() as Map<String, dynamic>;
      resto(RestosModel.fromJson(restoData));
      auth.refresh();
      update();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() async {
    user = auth.user;
    resto = auth.resto;

    print('masda');
    // await streamOrdersPaid();
    // await streamOrdersUnPaid();

    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    deleteReason!.dispose();
    super.dispose();
  }
}
