// import 'package:casso/app/data/models/deleted_order.dart';
// import 'package:casso/app/data/models/order.dart';
// import 'package:casso/app/modules/cashier/controllers/cashier_controller.dart';
// import 'package:casso/app/modules/cashier/views/components/prices_card.dart';
// import 'package:casso/app/utils/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DeletedOrderWidget extends StatelessWidget {
//   const DeletedOrderWidget({
//     Key? key,
//     required this.data,
//     this.dataOrderDeleted,
//     this.isView = false,
//   }) : super(key: key);

//   final Order? data;
//   final DeletedOrder? dataOrderDeleted;
//   final bool isView;

//   @override
//   Widget build(BuildContext context) {
//     final _formKey = GlobalKey<FormState>();

//     final controller = Get.put(CashierController());
//     return PricesCard(
//       data: data,
//       isPaid: true,
//       isPayment: true,
//       textField: Column(
//         children: [
//           Form(
//             key: _formKey,
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//               padding:
//                   const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 8),
//               height: 120,
//               width: Get.width,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: putih,
//               ),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.transparent,
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: abu),
//                 ),
//                 child: TextFormField(
//                   validator: (value) {
//                     if (value!.isEmpty)
//                       return "Alasan menghapus order tidak boleh kosong...";
//                   },
//                   readOnly: isView,
//                   controller: controller.deleteReason = TextEditingController(
//                       text: dataOrderDeleted!.deleteReason ?? ''),
//                   maxLines: 6,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontFamily: "Ubuntu",
//                     fontWeight: FontWeight.w500,
//                     color: darkColor,
//                   ),
//                   decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 8,
//                       vertical: 16,
//                     ),
//                     border: InputBorder.none,
//                     hintText: 'Alasan menghapus order',
//                     hintStyle: TextStyle(
//                       fontSize: 14,
//                       fontFamily: "Ubuntu",
//                       fontWeight: FontWeight.w500,
//                       color: darkColor.withOpacity(.6),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           isView
//               ? Container()
//               : GestureDetector(
//                   onTap: () async {
//                     if (_formKey.currentState!.validate()) {
//                       print('delete order');
//                       await controller.deleteOrder(data!);
//                       print('berhasil nih');

//                       Get.back();
//                     }
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.only(top: 8),
//                     height: 32,
//                     width: 132,
//                     decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [abu, abu],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.circular(25),
//                         boxShadow: [
//                           BoxShadow(
//                             color: darkColor.withOpacity(.4),
//                             blurRadius: 4,
//                             offset: Offset(4, 4),
//                           ),
//                           BoxShadow(
//                             color: putih.withOpacity(.4),
//                             blurRadius: 4,
//                             offset: Offset(-4, -4),
//                           ),
//                         ]),
//                     child: Center(
//                       child: Text(
//                         "HAPUS ORDER",
//                         style: TextStyle(
//                           color: darkColor,
//                           fontFamily: "Ubuntu",
//                           fontWeight: FontWeight.bold,
//                           fontSize: 13,
//                           letterSpacing: .5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//           SizedBox(height: 16),
//         ],
//       ),
//     );
//   }
// }
