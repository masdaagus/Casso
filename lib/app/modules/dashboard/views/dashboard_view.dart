// import 'package:casso/app/modules/dashboard/views/components/top_card.dart.dart';
// import 'package:casso/app/utils/constant.dart';
// import 'package:casso/app/utils/spinner_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import '../controllers/dashboard_controller.dart';
// import 'components/best_product.dart';
// import 'components/filter_by_date.dart';

// class DashboardView extends GetView<DashboardController> {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       systemNavigationBarColor: lightColor,
//       systemNavigationBarIconBrightness: Brightness.dark,
//       statusBarColor: darkColor,
//     ));
//     controller.user.value.name;
//     return Scaffold(
//       backgroundColor: lightColor,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios, size: 20, color: lightColor),
//           onPressed: Get.back,
//         ),
//         backgroundColor: darkColor,
//         elevation: 0,
//         title: Padding(
//           padding: const EdgeInsets.only(top: 0),
//           child: Text(
//             'DASHBOARD',
//             style: TextStyle(
//               color: lightColor,
//               fontFamily: "Ubuntu",
//               fontWeight: FontWeight.w600,
//               fontSize: 20,
//             ),
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           Stack(
//             children: [
//               DateFilter(),
//               RingkasanWidget(),
//               Container(
//                 margin: const EdgeInsets.only(top: 115),
//                 child: Column(
//                   children: [
//                     TopCard(),
//                     BestProduct(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           GetBuilder<DashboardController>(builder: (c) {
//             return c.isLoading
//                 ? Center(
//                     child: Container(
//                       height: Get.height,
//                       width: Get.width,
//                       color: hitam.withOpacity(.54),
//                       child: Center(
//                         child: Container(
//                           height: 72,
//                           width: 72,
//                           decoration: BoxDecoration(
//                             color: lightColor,
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: CustomSpinner(),
//                         ),
//                       ),
//                     ),
//                   )
//                 : Container();
//           })
//         ],
//       ),
//     );
//   }
// }

// class RingkasanWidget extends StatelessWidget {
//   const RingkasanWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<DashboardController>(
//       builder: (c) {
//         return Container(
//           padding: const EdgeInsets.only(left: 16, top: 78),
//           height: 160,
//           width: double.infinity,
//           color: darkColor,
//           child: Text(
//             "Ringkasan ${c.ringkasan ?? ''}",
//             style: TextStyle(
//               fontFamily: 'Ubuntu',
//               color: lightColor,
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
