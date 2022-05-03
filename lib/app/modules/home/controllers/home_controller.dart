import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final auth = Get.find<AuthController>();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var user = UsersModel().obs;
  var resto = RestosModel().obs;

  bool isLoading = false;

  List<UsersModel> employes = [];

  late TextEditingController restoName;
  late TextEditingController restoTable;
  late TextEditingController restoLocation;
  late TextEditingController restoTaxes;

  List<String> images = [
    "assets/images/head_people.jpeg",
    "assets/images/avatar-2.png",
    "assets/images/avatar-3.png",
    "assets/images/avatar-1.png",
    "assets/images/avatar-4.png",
  ];

  final now = DateTime.now();

  Future<void> _initEmployes() async {
    employes = resto.value.restoEmploye! as List<UsersModel>;
  }

  Future<void> _deleteOrdersCollection() async {
    final collectionOrdersPaid = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection('orders')
        .where('isPaid', isEqualTo: true);
    final collectionOrderHistories = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection('orders-histories');
    final collectionOrders = firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection('orders');

    QuerySnapshot queryOrders = await collectionOrdersPaid.get();

    await queryOrders.docs.map((doc) async {
      var object = doc.data() as Map<String, dynamic>;
      final data = Order.fromJson(object);

      DateTime dateData = DateTime.parse(data.createAt!);

      if (now.day != dateData.day) {
        await collectionOrderHistories.doc(data.orderId).set(data.toJson());
        await collectionOrders.doc(doc.id).delete();
        print('data berhasil dihapus');
      } else {
        print('data belum bisa dihapus');
      }
    }).toList();
  }

  Future<void> _deleteTersajiCollection() async {
    var collectionTersaji = await firestore
        .collection("restos")
        .doc(user.value.restoID)
        .collection('tersaji');

    QuerySnapshot queryTersaji = await collectionTersaji.get();

    queryTersaji.docs.map((doc) async {
      var object = doc.data() as Map<String, dynamic>;
      final data = Order.fromJson(object);

      DateTime dateData = DateTime.parse(data.createAt!);
      if (now.day != dateData.day) {
        await collectionTersaji.doc(doc.id).delete();
      }
    }).toList();
  }

  @override
  void onInit() async {
    user = auth.user;
    resto = auth.resto;
    await _initEmployes();

    super.onInit();
  }

  @override
  void onReady() async {
    Future.delayed(Duration(seconds: 1));
    await _deleteOrdersCollection();
    await _deleteTersajiCollection();

    super.onReady();
  }

  @override
  void onClose() {
    restoName.dispose();
    restoLocation.dispose();
    restoTable.dispose();
    restoTaxes.dispose();

    super.onClose();
  }

  // Future<void> updateResto() async {
  //   CollectionReference restos = firestore.collection("restos");
  //   int table = int.tryParse(restoTable.text) ?? 0;
  //   double taxes = double.tryParse(restoTaxes.text) ?? 0;
  //   String namaResto = restoName.text;
  //   String alamatResto = restoLocation.text;

  //   /// UPDATE TABLE
  //   if (table != resto.value.tables!.length && table != 0) {
  //     final List<TableModel> tables = resto.value.tables! as List<TableModel>;

  //     if (table < tables.length) {
  //       print('REMOVE TABLE');

  //       tables.removeRange(table, tables.length);

  //       await restos.doc(user.value.restoID).update({
  //         "tables": List<dynamic>.from(
  //           tables.map(
  //             (x) => x.toJson(),
  //           ),
  //         ),
  //         "restoTable": table.toInt()
  //       });
  //     } else {
  //       print('ADD TABLE');

  //       int finalTable = table - tables.length;

  //       final List<TableModel> tablesAdd = [];

  //       for (int i = 0; i < finalTable; i++) {
  //         tablesAdd.add(TableModel(
  //             tableNumber: (tables.length + 1) + i, guessName: null));
  //       }

  //       tables.addAll(tablesAdd);

  //       await restos.doc(user.value.restoID).update({
  //         "tables": List<dynamic>.from(
  //           tables.map(
  //             (x) => x.toJson(),
  //           ),
  //         ),
  //         "restoTable": table.toInt()
  //       });
  //     }
  //   }

  //   /// UPDATE NAMA RESTO
  //   if (namaResto != resto.value.restoName && namaResto != '') {
  //     await restos.doc(user.value.restoID).update({
  //       "restoName": namaResto,
  //     });
  //   }

  //   /// UPDATE LOKASI RESTO
  //   if (alamatResto != resto.value.restoLocation && alamatResto != '') {
  //     await restos.doc(user.value.restoID).update({
  //       "restoLocation": alamatResto,
  //     });
  //   }

  //   /// UPDATE TAXES RESTO
  //   if (taxes != resto.value.restoTaxes) {
  //     await restos.doc(user.value.restoID).update({
  //       "restoTaxes": taxes,
  //     });
  //   }

  //   final restoDoc = await restos.doc(user.value.restoID).get();
  //   final restoData = restoDoc.data() as Map<String, dynamic>;
  //   resto(RestosModel.fromJson(restoData));
  //   resto.refresh();
  //   auth.refresh();
  //   update();
  // }

}
