import 'package:casso/app/controllers/auth_controller.dart';

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

  late TextEditingController guessNameController;

  @override
  void onInit() {
    user = auth.user.value;
    resto = auth.resto.value;
    guessNameController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    guessNameController.dispose();
    super.onClose();
  }

  // dialog button
  // void dialog({
  //   int? table,
  // }) {
  //   Get.defaultDialog(
  //     content: Column(
  //       children: [
  //         Container(
  //           margin: const EdgeInsets.only(top: 16),
  //           padding: const EdgeInsets.symmetric(vertical: 8),
  //           width: Get.width,
  //           decoration: BoxDecoration(
  //               color: iconColor, borderRadius: BorderRadius.circular(20)),
  //           child: TextField(
  //             controller: guessNameController,
  //             textAlign: TextAlign.center,
  //             decoration: InputDecoration(
  //               isDense: true,
  //               hintStyle: TextStyle(
  //                 fontFamily: "balsamiq",
  //                 color: darkColor.withOpacity(.7),
  //                 fontSize: 13,
  //                 letterSpacing: -.5,
  //               ),
  //               border: InputBorder.none,
  //               hintText: "Masukkan nama pengunjung . . .",
  //               contentPadding: const EdgeInsets.symmetric(horizontal: 10),
  //             ),
  //           ),
  //         ),
  //         GestureDetector(
  //           onTap: () => Get.offNamed("/menu", arguments: table),
  //           child: Container(
  //             margin: const EdgeInsets.only(top: 40, bottom: 8),
  //             padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(25),
  //               color: darkColor,
  //               boxShadow: [
  //                 BoxShadow(
  //                   blurRadius: 6,
  //                   color: Colors.black.withOpacity(.45),
  //                   offset: Offset(3, 3),
  //                 ),
  //                 BoxShadow(
  //                   blurRadius: 6,
  //                   color: iconColor.withOpacity(.30),
  //                   offset: Offset(-3, -3),
  //                 ),
  //               ],
  //             ),
  //             child: Text(
  //               "PILIH MAKANAN",
  //               style: TextStyle(
  //                 color: textColor,
  //                 fontFamily: "balsamiq",
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 12,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //     title: "TABLE ${table! + 1}",
  //     titleStyle: TextStyle(
  //       color: lightColor,
  //       fontSize: 18,
  //       fontFamily: "balsamiq",
  //       fontWeight: FontWeight.bold,
  //     ),
  //     backgroundColor: darkColor,
  //     radius: 10,
  //     contentPadding: EdgeInsets.symmetric(horizontal: 24),
  //   );
  // }
}
