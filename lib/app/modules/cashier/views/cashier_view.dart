import 'package:casso/app/modules/cashier/views/paid/paid.dart';
import 'package:casso/app/modules/cashier/views/unpaid/unpaid.dart';
import 'package:casso/app/modules/monitoring/bindings/monitoring_binding.dart';
import 'package:casso/app/modules/monitoring/views/monitoring_view.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'deleted/orders_deleted.dart';

class CashierView extends StatelessWidget {
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
      length: 3,
      child: Scaffold(
        backgroundColor: lightColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 20, color: lightColor),
            onPressed: Get.back,
          ),
          backgroundColor: darkColor,
          elevation: 0,
          title: Text(
            'KASIR',
            style: TextStyle(
              color: lightColor,
              fontFamily: "Ubuntu",
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () {
                  Get.off(
                    () => MonitoringView(),
                    binding: MonitoringBinding(),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(
                    Icons.assignment_outlined,
                    color: lightColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                color: darkColor,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: TabBar(
                    labelColor: darkColor,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: putih.withOpacity(.2),
                    ),
                    tabs: [
                      textTab("UN-PAID"),
                      textTab("PAID"),
                      textTab("DELETED"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: TabBarView(
                    children: [
                      // tables view
                      Unpaid(),
                      Paid(),
                      OrdersDeleted(),
                    ],
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () => controller.deleteDataIfInTime(),
              //   child: Text("TES"),
              // )
            ],
          ),
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
            fontSize: 11,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
