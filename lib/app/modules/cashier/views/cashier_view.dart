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
        backgroundColor: lightColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 20, color: darkColor),
            onPressed: Get.back,
          ),
          backgroundColor: lightColor,
          elevation: 0,
          title: Text(
            'KASIR',
            style: TextStyle(
              color: darkColor,
              fontFamily: "balsamiq",
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.assignment_outlined,
                  color: darkColor,
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
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: abu,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 36,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: TabBar(
                    labelColor: darkColor,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: putih,
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
      ),
    );
  }

  Widget textTab(String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Text(
          text,
          style: TextStyle(
            color: darkColor,
            fontSize: 11,
            fontFamily: "balsamiq",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
