import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/constant.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/data/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final auth = Get.find<AuthController>();
  UsersModel user = UsersModel();
  RestosModel resto = RestosModel();

  @override
  void onInit() {
    user = auth.user.value;
    resto = auth.resto.value;
    // getResto();
    super.onInit();
  }

  @override
  void onClose() {}

  // dialog button
  void dialog({int? table}) {
    Get.defaultDialog(
      content: Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
                color: putih, borderRadius: BorderRadius.circular(20)),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontFamily: "Montserrat",
                  color: primaryColor.withOpacity(.7),
                  fontSize: 13,
                  letterSpacing: -.5,
                ),
                border: InputBorder.none,
                hintText: "Masukkan nama pengunjung . . .",
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                Get.offNamed("/menu", arguments: table);
              },
              child: Text(
                "Pilih makanan",
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontFamily: "Montserrat",
                ),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                primary: primaryColor.withOpacity(.8),
              ),
            ),
          ),
        ],
      ),
      title: "TABLE ${table! + 1}",
      titleStyle: TextStyle(
        color: primaryColor,
        fontSize: 18,
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
      ),
      backgroundColor: putih.withOpacity(.7),
      radius: 10,
      contentPadding: EdgeInsets.symmetric(horizontal: 24),
    );
  }
}
