// import 'dart:ui';

// import 'package:casso/app/data/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'components/card_chart.dart';

// class BotomSheet extends StatelessWidget {
//   const BotomSheet({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             putih.withOpacity(.3),
//             putih.withOpacity(.25),
//           ],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(40),
//           topRight: Radius.circular(40),
//         ),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(40),
//           topRight: Radius.circular(40),
//         ),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(
//             sigmaX: 20,
//             sigmaY: 20,
//           ),
//           child: Column(
//             children: [
//               /// Garis kek iphone yg di atas
//               Container(
//                 margin: const EdgeInsets.only(top: 8, bottom: 10),
//                 height: 6,
//                 width: 100,
//                 decoration: BoxDecoration(
//                   color: textColor,
//                   borderRadius: BorderRadius.circular(3),
//                 ),
//               ),

//               Expanded(
//                 child: SingleChildScrollView(
//                   physics: BouncingScrollPhysics(),
//                   child: Column(
//                     children: [
//                       ListView.builder(
//                         physics: NeverScrollableScrollPhysics(),
//                         shrinkWrap: true,
//                         itemCount: 3,
//                         itemBuilder: (context, index) {
//                           return CardChart();
//                         },
//                       ),
//                       Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 18),
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 18, vertical: 8),
//                         // height: 90,
//                         width: Get.width,
//                         decoration: BoxDecoration(
//                           color: textColor.withOpacity(.2),
//                           borderRadius: BorderRadius.circular(18),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Payment Summary",
//                               style: TextStyle(
//                                 color: primaryColor,
//                                 fontFamily: "Montserrat",
//                                 fontWeight: FontWeight.w600,
//                                 letterSpacing: -.5,
//                               ),
//                             ),
//                             SizedBox(height: 20),
//                             detailSummary(
//                                 tittle: "Nasi Goreng x3", price: "21.000"),
//                             detailSummary(tittle: "Cappucino", price: '19.000'),
//                             detailSummary(
//                                 tittle: 'Ikan Bakar', price: '14.000'),
//                             Divider(
//                               height: 1,
//                               color: hitam,
//                             ),
//                             SizedBox(height: 18),
//                             detailSummary(
//                                 tittle: 'Total Payment', price: '54.000'),
//                             Center(
//                               child: Container(
//                                 margin: const EdgeInsets.only(top: 30),
//                                 height: 40,
//                                 width: 150,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(18),
//                                     gradient: LinearGradient(
//                                       colors: [
//                                         biru.withOpacity(.4),
//                                         orange.withOpacity(.3),
//                                         ungu.withOpacity(.2),
//                                       ],
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.bottomRight,
//                                     ),
//                                     border: Border.all(
//                                         color: putih.withOpacity(.3))),
//                                 child: Center(
//                                   child: Text(
//                                     "BAYAR",
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontFamily: "Montserrat",
//                                       fontWeight: FontWeight.bold,
//                                       letterSpacing: -.5,
//                                       color: primaryColor,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 60),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget detailSummary({
//     String? tittle,
//     String? price,
//   }) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             tittle!,
//             style: TextStyle(fontSize: 12),
//           ),
//           Text(
//             "Rp${price}",
//             style: TextStyle(fontSize: 12),
//           ),
//         ],
//       ),
//     );
//   }
// }
