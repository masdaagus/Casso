import 'package:casso/app/data/constant.dart';
import 'package:casso/app/modules/monitoring/controllers/monitoring_controller.dart';
import 'package:casso/app/modules/monitoring/views/components/monitor_card.dart';
import 'package:casso/app/modules/monitoring/views/components/search_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderMonitoring extends GetView<MonitoringController> {
  const OrderMonitoring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          SearchCard(),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: controller.listData.length,
              itemBuilder: (context, index) {
                final data = controller.listData[index];
                return MonitorCard(
                  table: data["table"],
                  guessName: data["guessName"],
                  orderTime: data["timeOrder"],
                  orders: data['orders'],
                  isOrder: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}