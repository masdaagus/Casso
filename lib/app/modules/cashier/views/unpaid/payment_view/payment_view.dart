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
          icon: Icon(Icons.arrow_back_ios, size: 20, color: lightColor),
          onPressed: Get.back,
        ),
        backgroundColor: darkColor,
        elevation: 0,
        title: Text(
          'PEMBAYARAN',
          style: TextStyle(
            color: lightColor,
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
              PaymentOrderWidget(
                data: data,
                onTap: () {
                  controller.setPaid(data);
                  Get.back();
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
