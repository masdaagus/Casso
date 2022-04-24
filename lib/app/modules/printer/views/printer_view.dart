import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../components/floating_button/floating_button.dart';
import '../controllers/printer_controller.dart';

class PrinterView extends GetView<PrinterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20, color: lightColor),
          onPressed: Get.back,
        ),
        backgroundColor: darkColor,
        elevation: 0,
        title: Text(
          'Pengaturan Printer',
          style: TextStyle(
            color: lightColor,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: abu,
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.all(32),
              child: Icon(
                Icons.print_disabled_sharp,
                size: 64,
                color: darkColor,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "klik",
                  style: TextStyle(
                    color: darkColor,
                    fontFamily: 'Ubuntu',
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 4),
                Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: abu,
                    ),
                    child: Icon(Icons.add, size: 20)),
                SizedBox(width: 4),
                Text(
                  "untuk menambahkan",
                  style: TextStyle(
                    color: darkColor,
                    fontFamily: 'Ubuntu',
                    fontSize: 20,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingButton(),
    );
  }
}
