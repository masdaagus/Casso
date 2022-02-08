// import 'package:casso/app/data/constant.dart';
// import 'package:casso/app/modules/components/tables/card_table.dart';
// import 'package:casso/app/modules/order/controllers/order_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TablesOrder extends GetView<OrderController> {
//   const TablesOrder({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 24, top: 24, right: 24),
//       child: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             Container(
//               child: GridView.count(
//                 shrinkWrap: true,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 20,
//                 crossAxisCount: 3,
//                 childAspectRatio: .85,
//                 physics: BouncingScrollPhysics(),
//                 children: List.generate(19, (index) {
//                   return CardTable(
//                     tableNumber: index + 1,
//                     onTap: () {
//                       controller.dialog(table: index);
//                     },
//                   );
//                 }),
//               ),
//             ),
//             SizedBox(height: 20)
//           ],
//         ),
//       ),
//     );
//   }
// }
