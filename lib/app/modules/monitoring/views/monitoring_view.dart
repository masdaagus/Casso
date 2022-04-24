import 'package:casso/app/modules/monitoring/views/pesanan/pesanan_view.dart';
import 'package:casso/app/modules/monitoring/views/proses/proses_view.dart';
import 'package:casso/app/modules/monitoring/views/siap/siap_view.dart';
import 'package:casso/app/modules/monitoring/views/tersaji/tersaji_view.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/monitoring_controller.dart';
import 'components/search_card.dart';

class MonitoringView extends GetView<MonitoringController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: lightColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: darkColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: lightColor,
        appBar: AppBar(
          title: Text(
            'MONITORING',
            style: TextStyle(
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w600,
              color: lightColor,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: lightColor,
            ),
            onPressed: Get.back,
          ),
          backgroundColor: darkColor,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              color: darkColor,
              child: Container(
                padding: const EdgeInsets.all(4),
                child: TabBar(
                  labelColor: putih,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: putih.withOpacity(.2),
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
    return Container(
      height: 24,
      padding: const EdgeInsets.only(top: 2),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: lightColor,
            fontSize: 10,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
