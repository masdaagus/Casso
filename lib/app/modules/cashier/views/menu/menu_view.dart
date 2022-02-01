// import 'package:casso/app/data/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'bottom_sheet/bottom_sheet.dart';
// import 'components/button_chart.dart';
// import 'components/category.dart';
// import 'components/menu_card.dart';

// class Menus extends StatelessWidget {
//   const Menus({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: Get.height,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Categories(),
//           SizedBox(height: 18),
//           Expanded(
//             child: Stack(
//               children: [
//                 SingleChildScrollView(
//                   physics: BouncingScrollPhysics(),
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                         child: GridView.count(
//                           shrinkWrap: true,
//                           crossAxisSpacing: 10,
//                           mainAxisSpacing: 10,
//                           crossAxisCount: 3,
//                           childAspectRatio: .57,
//                           physics: BouncingScrollPhysics(),
//                           children: List.generate(12, (index) {
//                             return MenuCard(
//                               tittle: 'Makanan',
//                               harga: nf.format(21000),
//                               image: "assets/images/milkshake-oreo.jpg",
//                             );
//                           }),
//                         ),
//                       ),
//                       SizedBox(height: 80),
//                     ],
//                   ),
//                 ),
//                 ButtonChart(
//                   onTap: () => Get.bottomSheet(BotomSheet(),
//                       barrierColor: Color(0XFF858585).withOpacity(.3)),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
