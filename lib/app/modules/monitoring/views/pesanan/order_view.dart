import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/monitoring/controllers/monitoring_controller.dart';
import 'package:casso/app/modules/monitoring/views/components/monitor_card.dart';

import 'package:casso/app/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderMonitoring extends GetView<MonitoringController> {
  const OrderMonitoring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: controller.orderStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    List<Order> orderData =
                        snapshot.data!.docs.map((DocumentSnapshot doc) {
                      var data = doc.data() as Map<String, dynamic>;
                      // Order order_nih = Order(
                      //   guessName: data['guessName'],
                      //   waitersName: data['waitersName'],
                      //   tableNumber: data['tableNumbers'],
                      //   totalItems: data['totalItems'],
                      //   totalPrices: data['totalPrices'],
                      //   productsOrder: data['productsOrder'],
                      // );

                      Order a = Order.fromJson(data);
                      print(a.productsOrder);
                      return a;
                    }).toList();

                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: orderData.length,
                      itemBuilder: (context, index) {
                        Order data = orderData[index];
                        return MonitorCard(
                          data: data,
                          isOrder: true,
                        );
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            // ElevatedButton(
            //     onPressed: () => controller.getDataPesanan(),
            //     child: Text("TES"))
          ],
        ),
      ),
    );
  }
}
