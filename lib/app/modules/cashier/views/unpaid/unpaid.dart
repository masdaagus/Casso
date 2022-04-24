import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:casso/app/modules/cashier/views/components/search_box.dart';
import 'package:casso/app/modules/cashier/views/components/prices_card.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:casso/app/utils/spinner_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'delete_view/delete_view.dart';
import 'payment_view/payment_view.dart';

class Unpaid extends StatelessWidget {
  const Unpaid({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CashierController());
    return Scaffold(
      backgroundColor: lightColor,
      body: Column(
        children: [
          SizedBox(height: 8),
          // card seraching
          GetBuilder<CashierController>(
            builder: (c) {
              return SearchBox(
                onChange: (val) {
                  c.search = TextEditingController(text: val);
                  c.update();
                },
              );
            },
          ),
          // SearchBox(
          //   onChange: (val) {

          //   },
          // ),
          GetBuilder<CashierController>(builder: (c) {
            return Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  // stream: controller.a(false),
                  stream: (c.search.text.isEmpty)
                      ? c.streamOrders(false)
                      : c.filteredStream(false),
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
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }
                    }
                    return Center(child: CustomSpinner());
                  }),
            );
          })
          // })
        ],
      ),
    );
  }
}
