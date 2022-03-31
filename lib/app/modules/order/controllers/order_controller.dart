import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/table.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final auth = Get.find<AuthController>();
  var user = UsersModel().obs;
  var resto = RestosModel().obs;

  late TextEditingController guessNameController;

  Stream<DocumentSnapshot<Map<String, dynamic>>> initStream() {
    final data =
        firestore.collection("restos").doc(user.value.restoID).snapshots();
    print(data.runtimeType);

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
