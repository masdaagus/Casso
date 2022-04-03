import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/table.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:casso/app/modules/menu/views/menu_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final auth = Get.find<AuthController>();
  var user = UsersModel().obs;
  var resto = RestosModel().obs;

  late TextEditingController guessNameController;

  /// STREAM DATA
  Stream<DocumentSnapshot<Map<String, dynamic>>> initStream() {
    final data =
        firestore.collection("restos").doc(user.value.restoID).snapshots();

    return data;
  }

  Future<void> updateTable({int? tableNumber, String? guessName}) async {
    CollectionReference restos = firestore.collection("restos");
    try {
      final checkResto = await restos.doc(user.value.restoID).get();
      var data = checkResto.data() as Map<String, dynamic>;
      List<TableModel> tables = List<TableModel>.from(
          data["tables"].map((x) => TableModel.fromJson(x)));

      tables[tableNumber! - 1].guessName = guessName;
      await restos.doc(user.value.restoID).update({
        "tables": List<dynamic>.from(
          tables.map(
            (x) => x.toJson(),
          ),
        ),
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateOrder(int tableNumber) async {
    CollectionReference _collection = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection('orders');

    try {
      QuerySnapshot querySnapshot = await _collection.get();

      List<Order> _listOrder = querySnapshot.docs.map((doc) {
        var object = doc.data() as Map<String, dynamic>;
        final data = Order.fromJson(object);
        return data;
      }).toList();
      late Order dataOrder;

      _listOrder.forEach((order) {
        if (order.tableNumber == tableNumber) {
          dataOrder = order;
          print(dataOrder.guessName);
          print(dataOrder.tableNumber);
        }
      });
      // dataOrder = Order();

      Get.to(Menus(data: dataOrder));
    } catch (e) {
      print(e);
    }
  }

  Future<void> emptyTable(int tableNumber) async {
    CollectionReference restos = firestore.collection("restos");
    try {
      final checkResto = await restos.doc(user.value.restoID).get();
      var data = checkResto.data() as Map<String, dynamic>;
      List<TableModel> tables = List<TableModel>.from(
          data["tables"].map((x) => TableModel.fromJson(x)));

      tables[tableNumber - 1].guessName = null;
      await restos.doc(user.value.restoID).update({
        "tables": List<dynamic>.from(
          tables.map(
            (x) => x.toJson(),
          ),
        ),
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> getData() async {
    CollectionReference _collectionRef = FirebaseFirestore.instance
        .collection('restos')
        .doc(user.value.restoID)
        .collection('pesanan');
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) {
      var object = doc.data() as Map<String, dynamic>;
      final tes = Order.fromJson(object);
      return tes;
    }).toList();
  }

  ///
  @override
  void onInit() async {
    user = auth.user;
    resto = auth.resto;
    guessNameController = TextEditingController();
    await initStream();
    super.onInit();
  }

  @override
  void onClose() {
    guessNameController.dispose();
    super.onClose();
  }
}
