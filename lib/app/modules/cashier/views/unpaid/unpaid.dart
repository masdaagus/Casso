import 'package:casso/app/data/models/deleted_order.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:casso/app/modules/cashier/views/components/search_box.dart';
import 'package:casso/app/modules/cashier/views/components/prices_card.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:casso/app/utils/spinner_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bottom_sheet/bottom_sheet.dart';
import 'bottom_sheet/dialog_confirm/dialog_confirm.dart';
import 'delete_view/delete_view.dart';
import 'payment_view/payment_view.dart';

class Unpaid extends GetView<CashierController> {
  const Unpaid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: Column(
        children: [
          // card seraching
          SearchBox(),
          // List items dan total
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: controller.streamOrders(false),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    List<Order> orderData =
                        snapshot.data!.docs.map((DocumentSnapshot doc) {
                      var dataDoc = doc.data() as Map<String, dynamic>;
                      Order data = Order.fromJson(dataDoc);
                      return data;
                    }).toList();

                    if (orderData.length != 0) {
                      return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: orderData.length,
                          itemBuilder: (context, index) {
                            Order data = orderData[index];

                            return PricesCard(
                              onTap: () {
                                // Get.bottomSheet(
                                //   BottomSheetCashier(
                                //     data: data,
                                //     onTap: () {
                                //       Get.defaultDialog(
                                //         backgroundColor: Colors.transparent,
                                //         title: '',
                                //         content: DialogConfirm(
                                //           onTap: () {
                                //             controller.setPaid(data);
                                //             // controller.deleteOrder(data);
                                //           },
                                //         ),
                                //       );
                                //     },
                                //   ),
                                //   backgroundColor: Colors.transparent,
                                //   isScrollControlled: true,
                                // );

                                Get.to(
                                  () => PaymentOrderView(data: data),
                                  transition: Transition.cupertinoDialog,
                                  duration: Duration(milliseconds: 500),
                                );
                              },
                              delete: () {
                                Get.to(
                                  () => DeleteOrderView(data: data),
                                  transition: Transition.cupertinoDialog,
                                  duration: Duration(milliseconds: 500),
                                );
                              },
                              data: data,
                            );
                          });
                    } else {
                      return Center(
                        child: Text(
                          "DATA KOSONG",
                          style: TextStyle(
                            color: darkColor,
                            fontSize: 24,
                            fontFamily: 'balsamiq',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                  }
                  return Center(child: CustomSpinner());
                }),
          ),
        ],
      ),
    );
  }
}
