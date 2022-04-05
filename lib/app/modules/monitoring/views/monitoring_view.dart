import 'package:casso/app/modules/monitoring/views/pesanan/pesanan_view.dart';
import 'package:casso/app/modules/monitoring/views/proses/proses_view.dart';
import 'package:casso/app/modules/monitoring/views/siap/siap_view.dart';
import 'package:casso/app/modules/monitoring/views/tersaji/tersaji_view.dart';
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
        backgroundColor: lightColor,
        appBar: AppBar(
          title: Text(
            'MONITORING',
            style: TextStyle(
              fontFamily: "balsamiq",
              fontWeight: FontWeight.bold,
              color: darkColor,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: darkColor,
            ),
            onPressed: Get.back,
          ),
          backgroundColor: lightColor,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: abu,
                borderRadius: BorderRadius.circular(8),
              ),
              height: 32,
              child: Container(
                padding: const EdgeInsets.all(4),
                child: TabBar(
                  labelColor: putih,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: putih,
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
                    PesananMonitoring(),
                    ProsesMonitoring(),
                    SiapMonitoring(),
                    TersajiMonitoring(),
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
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        text,
        style: TextStyle(
          color: darkColor,
          fontSize: 9,
          fontFamily: "balsamiq",
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
