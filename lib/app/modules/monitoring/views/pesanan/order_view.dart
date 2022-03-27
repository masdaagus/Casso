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
                stream: controller.pesananStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    List<Order> orderData =
                        snapshot.data!.docs.map((DocumentSnapshot doc) {
                      var dataDoc = doc.data() as Map<String, dynamic>;
                      Order data = Order.fromJson(dataDoc);
                      return data;
                    }).toList();

                    List idDocs = snapshot.data!.docs;

                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: orderData.length,
                      itemBuilder: (context, index) {
                        Order data = orderData[index];
                        String id = idDocs[index].id;

                        return MonitorCard(
                          id: id,
                          data: data,
                          isOrder: true,
                          buttonAll: () => controller.setProsesAll(data, id),
                        );
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
