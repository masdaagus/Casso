import 'package:casso/app/modules/monitoring/views/pesanan/pesanan_view.dart';
import 'package:casso/app/modules/monitoring/views/proses/proses_view.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/monitoring_controller.dart';
import 'components/search_card.dart';

class MonitoringView extends GetView<MonitoringController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: darkColor,
        appBar: AppBar(
          title: Text(
            'MONITORING',
            style: TextStyle(
              fontFamily: "balsamiq",
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 20),
            onPressed: Get.back,
          ),
          backgroundColor: darkColor,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: lightColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(8),
              ),
              height: 30,
              child: Container(
                padding: const EdgeInsets.all(4),
                child: TabBar(
                  labelColor: textColor,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: darkColor,
                  ),
                  tabs: [
                    textTab("PESANAN"),
                    textTab("PROSES"),
                    textTab("SIAP"),
                    textTab("TERSAJI"),
                  ],
                ),
              ),
            ),
            SearchCard(),
            Expanded(
              child: Container(
                child: TabBarView(
                  children: [
                    // tables view
                    OrderMonitoring(),
                    ProsesMonitoring(),
                    Container(),
                    Container(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textTab(String text) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 9,
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
