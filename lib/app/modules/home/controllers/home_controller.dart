import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/table.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final auth = Get.put(AuthController());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var user = UsersModel().obs;
  var resto = RestosModel().obs;

  late TextEditingController restoName;
  late TextEditingController restoTable;
  late TextEditingController restoLocation;
  late TextEditingController restoTaxes;

  Future<void> updateResto() async {
    CollectionReference restos = firestore.collection("restos");
    int table = int.tryParse(restoTable.text) ?? 0;
    double taxes = double.tryParse(restoTaxes.text) ?? 0;
    String namaResto = restoName.text;
    String alamatResto = restoLocation.text;

    /// UPDATE TABLE
    if (table != resto.value.tables!.length && table != 0) {
      final List<TableModel> tables = resto.value.tables! as List<TableModel>;

      if (table < tables.length) {
        print('REMOVE TABLE');

        tables.removeRange(table, tables.length);

        await restos.doc(user.value.restoID).update({
          "tables": List<dynamic>.from(
            tables.map(
              (x) => x.toJson(),
            ),
          ),
          "restoTable": table.toInt()
        });
      } else {
        print('ADD TABLE');

        int finalTable = table - tables.length;

        final List<TableModel> tablesAdd = [];

        for (int i = 0; i < finalTable; i++) {
          tablesAdd.add(TableModel(
              tableNumber: (tables.length + 1) + i, guessName: null));
        }

        tables.addAll(tablesAdd);

        await restos.doc(user.value.restoID).update({
          "tables": List<dynamic>.from(
            tables.map(
              (x) => x.toJson(),
            ),
          ),
          "restoTable": table.toInt()
        });
      }
    }

    /// UPDATE NAMA RESTO
    if (namaResto != resto.value.restoName && namaResto != '') {
      await restos.doc(user.value.restoID).update({
        "restoName": namaResto,
      });
    }

    /// UPDATE LOKASI RESTO
    if (alamatResto != resto.value.restoLocation && alamatResto != '') {
      await restos.doc(user.value.restoID).update({
        "restoLocation": alamatResto,
      });
    }

    /// UPDATE TAXES RESTO
    if (taxes != resto.value.restoTaxes && taxes != 0.0) {
      await restos.doc(user.value.restoID).update({
        "restoTaxes": taxes,
      });
    }

    final restoDoc = await restos.doc(user.value.restoID).get();
    final restoData = restoDoc.data() as Map<String, dynamic>;
    resto(RestosModel.fromJson(restoData));
    resto.refresh();
    auth.refresh();
    update();
  }

  @override
  void onInit() {
    user = auth.user;
    resto = auth.resto;
    // restoName = TextEditingController();
    // restoLocation = TextEditingController();
    // restoTable = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    restoName.dispose();
    restoLocation.dispose();
    restoTable.dispose();

    super.onClose();
  }
}
