import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:casso/app/modules/cashier/views/components/payment_order_view.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentOrderView extends StatelessWidget {
  const PaymentOrderView({Key? key, required this.data}) : super(key: key);

  final Order data;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CashierController());
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20, color: darkColor),
          onPressed: Get.back,
        ),
        backgroundColor: lightColor,
        elevation: 0,
        title: Text(
          'PEMBAYARAN',
          style: TextStyle(
            color: darkColor,
            fontFamily: "Ubuntu",
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text("data"),
              PaymentOrderWidget(
                data: data,
                onTap: () {
                  controller.setPaid(data);
                  Get.back();

                  // Get.defaultDialog(
                  // radius: 16,
                  // actions: [
                  //   Icon(Icons.add),
                  //   Icon(Icons.add),
                  //   Icon(Icons.add),
                  // ],
                  // backgroundColor: Colors.transparent,

                  // confirm: Text("Widget Confirm"),
                  // content: Container(
                  //   height: 100,
                  //   width: 100,
                  //   color: darkColor,
                  // ),
                  // contentPadding: const EdgeInsets.all(16),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
