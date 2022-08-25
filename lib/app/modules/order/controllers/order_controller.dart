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
  // var user = UsersModel().obs;
  // var resto = RestosModel().obs;

  // late TextEditingController guessNameController;

  // /// STREAM DATA
  // Stream<DocumentSnapshot<Map<String, dynamic>>> initStream() {
  //   final data =
  //       firestore.collection("restos").doc(user.value.restoID).snapshots();

  //   return data;
  // }

  // Future<void> updateTable({int? tableNumber, String? guessName}) async {
  //   CollectionReference restos = firestore.collection("restos");
  //   try {
  //     final checkResto = await restos.doc(user.value.restoID).get();
  //     var data = checkResto.data() as Map<String, dynamic>;
  //     List<TableModel> tables = List<TableModel>.from(
  //         data["tables"].map((x) => TableModel.fromJson(x)));

  //     tables[tableNumber! - 1].guessName = guessName;
  //     await restos.doc(user.value.restoID).update({
  //       "tables": List<dynamic>.from(
  //         tables.map(
  //           (x) => x.toJson(),
  //         ),
  //       ),
  //     });

  //     final restoId = await restos.doc(user.value.restoID).get();
  //     final restoData = restoId.data() as Map<String, dynamic>;
  //     resto(RestosModel.fromJson(restoData));
  //     auth.refresh();
  //     update();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> updateOrder(int tableNumber) async {
  //   CollectionReference _collection = firestore
  //       .collection("restos")
  //       .doc(user.value.restoID)
  //       .collection('orders');

  //   try {
  //     QuerySnapshot querySnapshot = await _collection.get();

  //     List<Order> _listOrder = querySnapshot.docs.map((doc) {
  //       var object = doc.data() as Map<String, dynamic>;
  //       final data = Order.fromJson(object);
  //       return data;
  //     }).toList();
  //     Order? dataOrder;

  //     _listOrder.forEach((order) {
  //       if (order.tableNumber == tableNumber) {
  //         dataOrder = order;
  //         print(dataOrder!.guessName);
  //         print(dataOrder!.tableNumber);
  //       }
  //     });

  //     if (dataOrder != null) {
  //       CollectionReference restos = firestore.collection("restos");
  //       final restoId = await restos.doc(user.value.restoID).get();
  //       final restoData = restoId.data() as Map<String, dynamic>;
  //       resto(RestosModel.fromJson(restoData));
  //       auth.refresh();
  //       update();
  //       Get.to(() => Menus(data: dataOrder));
  //     } else {
  //       Get.back();
  //       Get.snackbar(
  //         'Table $tableNumber',
  //         'MEJA SUDAH KOSONG DI DAFTAR ORDER',
  //       );
  //     }
  //     CollectionReference restos = firestore.collection("restos");
  //     final restoId = await restos.doc(user.value.restoID).get();
  //     final restoData = restoId.data() as Map<String, dynamic>;
  //     resto(RestosModel.fromJson(restoData));
  //     auth.refresh();
  //     update();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<void> emptyTable(int tableNumber) async {
  //   CollectionReference restos = firestore.collection("restos");
  //   try {
  //     final checkResto = await restos.doc(user.value.restoID).get();
  //     var data = checkResto.data() as Map<String, dynamic>;
  //     List<TableModel> tables = List<TableModel>.from(
  //         data["tables"].map((x) => TableModel.fromJson(x)));

  //     tables[tableNumber - 1].guessName = null;
  //     await restos.doc(user.value.restoID).update({
  //       "tables": List<dynamic>.from(
  //         tables.map(
  //           (x) => x.toJson(),
  //         ),
  //       ),
  //     });

  //     final restoId = await restos.doc(user.value.restoID).get();
  //     final restoData = restoId.data() as Map<String, dynamic>;
  //     resto(RestosModel.fromJson(restoData));
  //     auth.refresh();
  //     update();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // @override
  // void onInit() async {
  //   user = auth.user;
  //   resto = auth.resto;
  //   guessNameController = TextEditingController();
  //   await initStream();
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   guessNameController.dispose();
  //   super.onClose();
  // }
}
