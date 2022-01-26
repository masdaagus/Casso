import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cashier_controller.dart';
import 'menu/menu_view.dart';
import 'table/table_view.dart';

class CashierView extends GetView<CashierController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
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
              margin: EdgeInsets.symmetric(horizontal: 24),
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
                    textTab("TABLES"),
                    textTab("MENU"),
                  ],
                ),
              ),
            ),
            Container(
              height: Get.height - 119,
              child: TabBarView(
                children: [
                  // tables view
                  Tables(),
                  Menus(),
                ],
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
        fontFamily: "Montserrat",
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
