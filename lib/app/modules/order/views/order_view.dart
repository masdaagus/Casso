import 'package:casso/app/modules/card/table_card/table_card.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_controller.dart';
import 'components/dialog.dart';

class OrderView extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(
        backgroundColor: darkColor,
        elevation: 0,
        title: Text(
          'ORDER',
          style: TextStyle(
            color: textColor,
            fontFamily: "balsamiq",
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20),
          onPressed: Get.back,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 24, top: 24, right: 24),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 3,
                  physics: BouncingScrollPhysics(),
                  children: List.generate(
                    controller.resto.restoTable!,
                    (index) {
                      return TableCard(
                        tableNumber: index + 1,
                        onTap: () {
                          Get.defaultDialog(
                            content: GetDialog(tableNumber: index),
                            backgroundColor: Colors.transparent,
                            titleStyle: TextStyle(color: Colors.transparent),
                            barrierDismissible: false,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
