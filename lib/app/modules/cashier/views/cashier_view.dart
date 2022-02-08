import 'package:casso/app/data/constant.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cashier_controller.dart';

import 'monitoring/monitoring.dart';

class CashierView extends GetView<CashierController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 20),
            onPressed: Get.back,
          ),
          backgroundColor: primaryColor,
          elevation: 0,
          title: Text(
            'KASIR',
            style: TextStyle(
              color: textColor,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                children: [
                  Icon(Icons.update_outlined),
                  SizedBox(width: 8),
                  Icon(Icons.assignment_outlined),
                ],
              ),
            ),
          ],
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
                    textTab("MENUNGGU"),
                    textTab("PROSES"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  children: [
                    // tables view
                    Monitoring(),
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
        // fontSize: 10,
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
