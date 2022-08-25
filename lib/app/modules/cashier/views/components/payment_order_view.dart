// import 'package:casso/app/data/models/deleted_order.dart';
// import 'package:casso/app/data/models/order.dart';
// import 'package:casso/app/modules/cashier/controllers/cashier_controller.dart';
// import 'package:casso/app/modules/cashier/views/components/prices_card.dart';
// import 'package:casso/app/utils/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class PaymentOrderWidget extends StatelessWidget {
//   const PaymentOrderWidget({
//     Key? key,
//     required this.data,
//     this.onTap,
//     this.isView = false,
//   }) : super(key: key);

//   final Order data;
//   final VoidCallback? onTap;
//   final bool isView;

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<CashierController>();
//     double taxes = controller.resto.value.restoTaxes!;
//     double grandTotal = ((data.totalPrices! * taxes) / 100) + data.totalPrices!;
//     return PricesCard(
//       data: data,
//       isPaid: true,
//       isPayment: true,
//       textField: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//             padding:
//                 const EdgeInsets.only(left: 8, right: 8, bottom: 16, top: 8),
//             // height: 140,
//             width: Get.width,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: putih,
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   "DETAIL PEMBAYARAN",
//                   style: TextStyle(
//                     color: darkColor,
//                     fontFamily: "Ubuntu",
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                     letterSpacing: .2,
//                   ),
//                 ),
//                 SizedBox(height: 40),
//                 totalNppn('TOTAL', data.totalPrices!),
//                 totalNppn('PAJAK(${taxes.toStringAsFixed(0)}%)',
//                     (data.totalPrices! * taxes) / 100),
//                 customDivider(),
//                 totalNppn('GRAND TOTAL', grandTotal),
//               ],
//             ),
//           ),
//           isView
//               ? Container()
//               : GestureDetector(
//                   onTap: onTap,
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
//                         "BAYAR",
//                         style: TextStyle(
//                           color: darkColor,
//                           fontFamily: "Ubuntu",
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
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

//   Widget customDivider() {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: 1.5,
//             width: Get.width - 90,
//             color: darkColor.withOpacity(.4),
//           ),
//           Icon(Icons.add, size: 16, color: darkColor.withOpacity(.4)),
//         ],
//       ),
//     );
//   }

//   Widget totalNppn(String tittle, double amount) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             tittle,
//             style: TextStyle(
//               color: darkColor,
//               fontFamily: "Ubuntu",
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//               letterSpacing: .5,
//             ),
//           ),
//           Text(
//             nf.format(amount),
//             style: TextStyle(
//               color: darkColor,
//               fontFamily: "Ubuntu",
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//               letterSpacing: .5,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
