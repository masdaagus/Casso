import 'package:casso/app/utils/constant.dart';
import 'package:casso/app/utils/spinner_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import 'components/button_choice_history.dart';
import 'components/header.dart';
import 'components/product_best_seller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    controller.user.value.name;
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20, color: darkColor),
          onPressed: Get.back,
        ),
        backgroundColor: lightColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            'DASHBOARD',
            style: TextStyle(
              color: darkColor,
              fontFamily: "balsamiq",
              letterSpacing: .5,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          HeaderDashboard(),
          Container(
            height: Get.height - 348,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: abu,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: putih,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    children: [
                      Container(
                        // height: 100,
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.only(
                            left: 8, top: 8, right: 8, bottom: 16),
                        decoration: BoxDecoration(
                          color: abu,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "PENJUALAN",
                              style: TextStyle(
                                color: darkColor.withOpacity(.7),
                                fontFamily: 'balsamiq',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            GetBuilder<DashboardController>(
                              builder: (c) {
                                return Text(
                                  nf.format(c.totalPenjualan),
                                  style: TextStyle(
                                    color: darkColor,
                                    fontFamily: 'balsamiq',
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // height: 164,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: abu,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProductBestSeller(),
                            ProductBestSeller(),
                            ProductBestSeller(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     ButtonHistory(),
                //     ButtonHistory(tittle: 'WEEKLY'),
                //     ButtonHistory(tittle: 'MONTLY'),
                //   ],
                // ),
                // ElevatedButton(
                //     onPressed: () {
                //       print(controller.totalPenjualan);
                //     },
                //     child: Text("TES")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
