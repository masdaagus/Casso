// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:casso/app/utils/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ConfirmOrderView extends StatelessWidget {
//   const ConfirmOrderView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: lightColor,
//       appBar: AppBar(
//         backgroundColor: lightColor,
//         elevation: 0,
//         title: Text(
//           'KONFIRMASI ORDER',
//           style: TextStyle(
//             color: darkColor,
//             fontFamily: "balsamiq",
//             fontWeight: FontWeight.w600,
//             letterSpacing: .5,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: darkColor,
//           ),
//           onPressed: () => Get.back(),
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.only(left: 8, right: 8),
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               color: abu,
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(bottom: 8),
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: lightColor,
//                   ),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 32),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "TABLE 12 = (MASDA)",
//                               style: TextStyle(
//                                 color: darkColor,
//                                 fontFamily: 'balsamiq',
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               "Boy candra",
//                               style: TextStyle(
//                                 color: darkColor,
//                                 fontFamily: 'balsamiq',
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Text(
//                                 "Items = 4",
//                                 style: TextStyle(
//                                   color: darkColor,
//                                   fontFamily: 'balsamiq',
//                                   fontSize: 14,
//                                 ),
//                               ),
//                               SizedBox(height: 6),
//                               Text(
//                                 "Total harga = Rp23.000",
//                                 style: TextStyle(
//                                   color: darkColor,
//                                   fontFamily: 'balsamiq',
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Container()
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: lightColor,
//                   ),
//                   child: Column(
//                     children: [
//                       ListItemOrder(),
//                       ListItemOrder(),
//                       ListItemOrder(),
//                       ListItemOrder(),
//                       ListItemOrder(),
//                       ListItemOrder(),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ListItemOrder extends StatelessWidget {
//   const ListItemOrder({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Slidable(
//       endActionPane: ActionPane(
//         extentRatio: .22,
//         motion: const ScrollMotion(),
//         children: [
//           Container(
//             margin: const EdgeInsets.only(left: 16),
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: lightColor,
//               boxShadow: [
//                 BoxShadow(
//                   blurRadius: 3,
//                   offset: Offset(3, 3),
//                   color: hitam.withOpacity(.25),
//                 ),
//                 BoxShadow(
//                   blurRadius: 3,
//                   offset: Offset(-3, -3),
//                   color: putih.withOpacity(.75),
//                 ),
//               ],
//               borderRadius: BorderRadius.circular(100),
//             ),
//             child: Icon(
//               Icons.edit,
//               size: 32,
//             ),
//           )
//         ],
//       ),
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 8),
//         child: Column(
//           children: [
//             Container(
//               height: 4,
//               decoration: BoxDecoration(
//                 color: putih,
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(4),
//                 ),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
//               // height: 56,
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: grColor1,
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(4),
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 3,
//                       offset: Offset(0, 3),
//                       color: hitam.withOpacity(.15),
//                     ),
//                   ]),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Kentang Goreng",
//                         style: TextStyle(
//                           color: darkColor,
//                           fontFamily: 'balsamiq',
//                           fontSize: 14,
//                         ),
//                       ),
//                       SizedBox(height: 6),
//                       Text(
//                         "Rp13.000",
//                         style: TextStyle(
//                           color: darkColor.withOpacity(.8),
//                           fontFamily: 'balsamiq',
//                           fontSize: 13,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     padding: const EdgeInsets.symmetric(),
//                     child: Row(
//                       children: [
//                         ButtonControl(icon: Icons.remove),
//                         SizedBox(width: 16),
//                         Text(
//                           "2",
//                           style: TextStyle(
//                             color: darkColor,
//                             fontFamily: 'balsamiq',
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         ButtonControl(icon: Icons.add),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ButtonControl extends StatelessWidget {
//   const ButtonControl({
//     Key? key,
//     this.icon,
//   }) : super(key: key);

//   final IconData? icon;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(left: 16),
//       height: 28,
//       width: 28,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: lightColor,
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 2,
//             color: hitam.withOpacity(.25),
//             offset: Offset(2, 2),
//           ),
//         ],
//       ),
//       child: Icon(
//         icon,
//         color: darkColor,
//       ),
//     );
//   }
// }
