import 'package:casso/app/utils/constant.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cashier_controller.dart';

import 'menunggu/menunggu.dart';

class CashierView extends GetView<CashierController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: darkColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 20),
            onPressed: Get.back,
          ),
          backgroundColor: darkColor,
          elevation: 0,
          title: Text(
            'KASIR',
            style: TextStyle(
              color: abu,
              fontFamily: "balsamiq",
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
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
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: lightColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(8),
              ),
              height: 36,
              child: Container(
                padding: const EdgeInsets.all(4),
                child: TabBar(
                  labelColor: abu,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: darkColor,
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
                    Menunggu(),
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
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: abu,
          fontSize: 11,
          fontFamily: "balsamiq",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
