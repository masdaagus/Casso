import 'package:casso/app/data/constant.dart';
import 'package:casso/app/modules/components/tables/card_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_controller.dart';
import 'components/tables_order.dart';

class OrderView extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          'ORDER',
          style: TextStyle(
            color: textColor,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
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
                  childAspectRatio: .85,
                  physics: BouncingScrollPhysics(),
                  children: List.generate(19, (index) {
                    return CardTable(
                      tableNumber: index + 1,
                      onTap: () {
                        controller.dialog(table: index);
                      },
                    );
                  }),
                ),
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
