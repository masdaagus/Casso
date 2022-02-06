import 'package:casso/app/data/constant.dart';
import 'package:casso/app/modules/monitoring/views/pesanan/pesanan_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/monitoring_controller.dart';

class MonitoringView extends GetView<MonitoringController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text(
            'MONITORING',
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          leading: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: textColor.withOpacity(.5),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 30,
              child: Container(
                padding: const EdgeInsets.all(2),
                child: TabBar(
                  labelColor: textColor,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primaryColor,
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
            Expanded(
              child: Container(
                child: TabBarView(
                  children: [
                    // tables view
                    MenungguMonitoring(),
                    Container(),
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
