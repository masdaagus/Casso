import 'package:casso/app/data/models/deleted_order.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/deleted_order_view.dart';

class DeleteOrderView extends StatelessWidget {
  const DeleteOrderView({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Order data;

  @override
  Widget build(BuildContext context) {
    DeletedOrder emptyData = DeletedOrder();
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
          'HAPUS ORDER',
          style: TextStyle(
            color: darkColor,
            fontFamily: "balsamiq",
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
              DeletedOrderWidget(
                data: data,
                dataOrderDeleted: emptyData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
