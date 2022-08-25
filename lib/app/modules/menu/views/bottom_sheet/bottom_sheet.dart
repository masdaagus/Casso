// // import 'dart:ui';

// import 'dart:ui';

// import 'package:casso/app/data/models/order.dart';
// import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
// import 'package:casso/app/modules/menu/views/bottom_sheet/components/notes_dialog.dart';
// import 'package:casso/app/modules/monitoring/views/components/card_no_order.dart';
// import 'package:casso/app/utils/constant.dart';
// import 'package:casso/app/utils/spinner_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'components/button_order.dart';
// import 'components/item_widget.dart';
// // import 'components/card_chart.dart';

// class CustomBottomSheet extends GetView<MenuController> {
//   const CustomBottomSheet({
//     Key? key,
//     this.waitersName,
//     this.tableNumber,
//     this.guessName,
//     this.onTap,
//   }) : super(key: key);

//   final String? guessName;
//   final String? waitersName;
//   final int? tableNumber;

//   final VoidCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     final List<ProductOrder> productOrders = controller
//         .order.value.productsOrder!
//         .where((d) => d.productQty != 0)
//         .toList();

//     final ids = Set();
//     productOrders.retainWhere(
//       (x) => ids.add(x.productName),
//     );

//     return GestureDetector(
//       onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
//       child: ClipRRect(
//         child: Container(
//           height: Get.height * .8,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 lightColor.withOpacity(1),
//                 lightColor.withOpacity(1),
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//             borderRadius: BorderRadius.vertical(
//               top: Radius.circular(24),
//             ),
//           ),
//           child: Stack(
//             children: [
//               Container(
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(top: 8, bottom: 20),
//                       height: 4,
//                       width: 60,
//                       decoration: BoxDecoration(
//                         color: darkColor.withOpacity(.4),
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                     ),
//                     Column(
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.only(left: 8, right: 8),
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 8, vertical: 12),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: putih,
//                           ),
//                           child: Column(
//                             children: [
//                               Container(
//                                 margin: const EdgeInsets.only(bottom: 8),
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 12,
//                                   vertical: 8,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: biru.withOpacity(.5),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       "TABLE ${tableNumber} = ($guessName)",
//                                       style: TextStyle(
//                                         color: darkColor,
//                                         fontFamily: 'Ubuntu',
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text(
//                                       "By ${controller.user.value.name}",
//                                       style: TextStyle(
//                                         color: darkColor,
//                                         fontFamily: 'Ubuntu',
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 12, vertical: 4),
//                                 decoration: BoxDecoration(
//                                   color: abu.withOpacity(.24),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         GetBuilder<MenuController>(
//                                           builder: (c) {
//                                             int total = 0;

//                                             productOrders.forEach((d) {
//                                               total += d.productQty;
//                                             });

//                                             if (total < 0) {
//                                               total = 0;
//                                             }
//                                             return Text(
//                                               "Items = ${total}",
//                                               style: TextStyle(
//                                                 color: darkColor,
//                                                 fontFamily: 'Ubuntu',
//                                                 fontSize: 14,
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                         SizedBox(height: 6),
//                                         Obx(() => Text(
//                                               "Total harga = ${nf.format(controller.order.value.totalPrices)}",
//                                               style: TextStyle(
//                                                 color: darkColor,
//                                                 fontFamily: 'Ubuntu',
//                                                 fontSize: 14,
//                                               ),
//                                             )),
//                                       ],
//                                     ),
//                                     Container()
//                                   ],
//                                 ),
//                               ),
//                               Divider(
//                                   thickness: 1,
//                                   color: darkColor.withOpacity(.2)),
//                               SizedBox(height: 8),
//                               ConstrainedBox(
//                                   // color: merah,
//                                   constraints: BoxConstraints(
//                                     maxHeight: Get.height * .5,
//                                   ),
//                                   child: SingleChildScrollView(
//                                     physics: BouncingScrollPhysics(),
//                                     child: Column(
//                                       children: [
//                                         GetBuilder<MenuController>(
//                                             builder: (c) {
//                                           return ListView.builder(
//                                               physics:
//                                                   NeverScrollableScrollPhysics(),
//                                               shrinkWrap: true,
//                                               itemCount: productOrders.length,
//                                               itemBuilder: (context, index) {
//                                                 ProductOrder data =
//                                                     productOrders[index];

//                                                 if (data.productQty != 0) {
//                                                   return ListItemOrder(
//                                                     data: data,
//                                                     onTap: () {
//                                                       Get.defaultDialog(
//                                                         content: NotesDialog(
//                                                             data: data),
//                                                         backgroundColor:
//                                                             Colors.transparent,
//                                                         titleStyle: TextStyle(
//                                                           color: Colors
//                                                               .transparent,
//                                                         ),
//                                                       );
//                                                       print('add notes');
//                                                     },
//                                                   );
//                                                 }
//                                                 return Container();
//                                               });
//                                         }),
//                                       ],
//                                     ),
//                                   )),
//                             ],
//                           ),
//                         ),
//                         (productOrders.length == 0)
//                             ? Padding(
//                                 padding: const EdgeInsets.only(top: 60),
//                                 child: NoOrderWidget(),
//                               )
//                             : Container()
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 24),
//                   child: productOrders.length != 0
//                       ? ButtonOrder(onTap: onTap)
//                       : Container(),
//                 ),
//               ),
//               GetBuilder<MenuController>(builder: (c) {
//                 return c.isLoading
//                     ? Center(
//                         child: Container(
//                           height: Get.height,
//                           width: Get.width,
//                           color: hitam.withOpacity(.54),
//                           child: Center(
//                             child: Container(
//                               height: 72,
//                               width: 72,
//                               decoration: BoxDecoration(
//                                 color: lightColor,
//                                 borderRadius: BorderRadius.circular(16),
//                               ),
//                               child: CustomSpinner(),
//                             ),
//                           ),
//                         ),
//                       )
//                     : Container();
//               })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
