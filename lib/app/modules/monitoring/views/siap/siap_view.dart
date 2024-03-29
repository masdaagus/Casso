// import 'package:casso/app/data/models/order.dart';
// import 'package:casso/app/modules/monitoring/controllers/monitoring_controller.dart';
// import 'package:casso/app/modules/monitoring/views/components/alert.dart';
// import 'package:casso/app/modules/monitoring/views/components/card_no_order.dart';
// import 'package:casso/app/modules/monitoring/views/components/monitor_card.dart';
// import 'package:casso/app/modules/monitoring/views/components/order_item.dart';

// import 'package:casso/app/utils/constant.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SiapMonitoring extends GetView<MonitoringController> {
//   const SiapMonitoring({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: lightColor,
//       body: Container(
//         child: Column(
//           children: [
//             Expanded(
//               child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//                 stream: controller.initStream('siap'),
//                 builder: (context, snapshot) {
//                   print(snapshot);
//                   if (snapshot.connectionState == ConnectionState.active) {
//                     List<Order> orderData =
//                         snapshot.data!.docs.map((DocumentSnapshot doc) {
//                       var dataDoc = doc.data() as Map<String, dynamic>;
//                       Order data = Order.fromJson(dataDoc);
//                       print(data);
//                       return data;
//                     }).toList();

//                     List idDocs = snapshot.data!.docs;
//                     if (orderData.length == 0) {
//                       return NoOrderWidget();
//                     }

//                     return ListView.builder(
//                       physics: BouncingScrollPhysics(),
//                       itemCount: orderData.length,
//                       itemBuilder: (context, index) {
//                         Order data = orderData[index];
//                         String id = idDocs[index].id;

//                         /// func agar data tidak duplicate
//                         List<ProductOrder> productOrders = data.productsOrder!;
//                         String status = controller.user.value.status!;
//                         bool getAcses;
//                         bool accesTersaji;

//                         switch (status) {
//                           case 'OWNER':
//                             getAcses = true;
//                             accesTersaji = true;
//                             break;
//                           case 'CASHIER':
//                             getAcses = true;
//                             accesTersaji = true;
//                             break;
//                           case 'KITCHEN':
//                             getAcses = true;
//                             accesTersaji = false;
//                             break;
//                           case 'WAITERS':
//                             getAcses = false;
//                             accesTersaji = true;
//                             break;
//                           default:
//                             getAcses = false;
//                             accesTersaji = true;
//                             break;
//                         }

//                         print(data.productsOrder!.length);
//                         return MonitorCard(
//                           data: data,
//                           isOrder: false,
//                           orderButton: 'tersaji',
//                           buttonAll: () {
//                             if (accesTersaji) {
//                               // controller.setProsesAll(
//                               //   data,
//                               //   id,
//                               //   'siap',
//                               //   'tersaji',
//                               // );

//                               Get.defaultDialog(
//                                 content: CustomAlertDialog(onTap: () {
//                                   controller
//                                       .setProsesAll(
//                                         data,
//                                         id,
//                                         'siap',
//                                         'tersaji',
//                                       )
//                                       .then((value) => Get.back());
//                                 }),
//                                 backgroundColor: lightColor,
//                                 title: '',
//                               );
//                             } else {
//                               Get.snackbar(
//                                 status,
//                                 "DON'T HAVE ACCSES",
//                               );
//                             }
//                           },
//                           listOrder: Container(
//                             child: ListView.builder(
//                               physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: data.productsOrder!.length,
//                               itemBuilder: (context, index) {
//                                 ProductOrder productOrder =
//                                     productOrders[index];

//                                 return OrderItem(
//                                     data: productOrder,
//                                     onTap: () {
//                                       if (accesTersaji) {
//                                         controller.setProses(
//                                           data,
//                                           id,
//                                           productOrder,
//                                           'siap',
//                                           'tersaji',
//                                         );
//                                       } else {
//                                         Get.snackbar(
//                                           status,
//                                           "DON'T HAVE ACCSES",
//                                         );
//                                       }
//                                       // controller.setProses(
//                                       //   data,
//                                       //   id,
//                                       //   productOrder,
//                                       //   'siap',
//                                       //   'tersaji',
//                                       // );
//                                     },
//                                     isOrder: false,
//                                     textButton: 'tersaji',
//                                     undoButton: () {
//                                       if (getAcses) {
//                                         controller.reverseProses(
//                                           data,
//                                           id,
//                                           productOrder,
//                                           'proses',
//                                           'siap',
//                                         );
//                                       } else {
//                                         Get.snackbar(
//                                           status,
//                                           "DON'T HAVE ACCSES",
//                                         );
//                                       }
//                                     });
//                               },
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }
//                   return Center(child: CircularProgressIndicator());
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
