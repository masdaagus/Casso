import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cashier_controller.dart';
import 'components/card_table.dart';

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
              height: 40,
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

            // tables view
            Container(
              height: Get.height - 130,
              child: TabBarView(
                children: [
                  Tables(),
                  Text("MENU"),
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

class Tables extends StatelessWidget {
  const Tables({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardTable(),
              CardTable(),
              CardTable(),
            ],
          ),
          Container(
            height: 300,
            color: orange,
          )
          // ListView.builder(
          //   itemCount: 6,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       height: 100,
          //       width: 100,
          //       color: Colors.red,
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}
