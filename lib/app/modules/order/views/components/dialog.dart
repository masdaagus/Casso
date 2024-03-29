// import 'dart:ui';
// import 'package:casso/app/data/models/order.dart';
// import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
// import 'package:casso/app/modules/menu/views/menu_view.dart';
// import 'package:casso/app/modules/order/controllers/order_controller.dart';
// import 'package:casso/app/utils/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'button_dialog.dart';

// class GetDialog extends GetView<OrderController> {
//   GetDialog({Key? key, required this.tableNumber}) : super(key: key);

//   final int tableNumber;
//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       child: BackdropFilter(
//         filter: ImageFilter.blur(
//           sigmaX: 10,
//           sigmaY: 10,
//         ),
//         child: Container(
//           padding: const EdgeInsets.only(top: 16, bottom: 8),
//           width: Get.width,
//           // height: 180,
//           decoration: BoxDecoration(
//             color: putih.withOpacity(.50),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Form(
//             key: formKey,
//             child: Column(
//               children: [
//                 Text(
//                   "TABLE ${tableNumber}",
//                   style: TextStyle(
//                     color: darkColor,
//                     fontFamily: "Ubuntu",
//                     fontWeight: FontWeight.bold,
//                     fontSize: 24,
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(
//                       top: 16, left: 24, right: 24, bottom: 24),
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   width: Get.width,
//                   decoration: BoxDecoration(),
//                   child: TextFormField(
//                     validator: (value) {
//                       if (value!.isEmpty) return "Nama tidak boleh kosong";
//                     },
//                     controller: controller.guessNameController,
//                     textAlign: TextAlign.center,
//                     maxLength: 10,
//                     style: TextStyle(
//                       fontFamily: "Ubuntu",
//                       color: darkColor,
//                       fontSize: 16,
//                       letterSpacing: -.5,
//                     ),
//                     decoration: InputDecoration(
//                       errorStyle: TextStyle(
//                         color: merah,
//                         fontFamily: "Ubuntu",
//                         fontSize: 14,
//                         letterSpacing: 1,
//                       ),
//                       counterText: "",
//                       hintStyle: TextStyle(
//                         fontFamily: "Ubuntu",
//                         color: darkColor.withOpacity(.8),
//                         fontSize: 14,
//                         letterSpacing: 1,
//                       ),
//                       hintText: "Masukkan nama pengunjung . . .",
//                       contentPadding:
//                           const EdgeInsets.symmetric(horizontal: 10),
//                     ),
//                   ),
//                 ),
//                 Divider(thickness: 1, color: darkColor.withOpacity(.6)),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     DialogButton(
//                       isConfirm: false,
//                       isConfirmText: 'CANCEL',
//                       onTap: () => Get.back(),
//                     ),
//                     DialogButton(onTap: () async {
//                       if (formKey.currentState!.validate()) {
//                         Get.put(MenuController());
//                         Order emptyData = Order();
//                         Get.to(() => Menus(
//                               guessName: controller.guessNameController.text
//                                   .toUpperCase(),
//                               table: tableNumber,
//                               data: emptyData,
//                             ));
//                         controller.updateTable(
//                           tableNumber: tableNumber,
//                           guessName:
//                               controller.guessNameController.text.toUpperCase(),
//                         );
//                       }
//                     }),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
