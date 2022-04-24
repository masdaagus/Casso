import 'package:casso/app/data/models/deleted_order.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:casso/app/modules/cashier/views/components/deleted_order_view.dart';
import 'package:casso/app/modules/cashier/views/components/search_box.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:casso/app/utils/spinner_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersDeleted extends GetView<CashierController> {
  const OrdersDeleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 8),
              // card seraching
              SearchBox(),
              // List items dan total
              Expanded(
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: controller.streamOrdersDeleted(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        List<DeletedOrder> deletedOrdersData =
                            snapshot.data!.docs.map((DocumentSnapshot doc) {
                          var dataDoc = doc.data() as Map<String, dynamic>;
                          DeletedOrder data = DeletedOrder.fromJson(dataDoc);
                          return data;
                        }).toList();

                        return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: deletedOrdersData.length,
                            itemBuilder: (context, index) {
                              DeletedOrder delDataOrder =
                                  deletedOrdersData[index];
                              Order data = delDataOrder.order!;

                              return DeletedOrderWidget(
                                data: data,
                                dataOrderDeleted: delDataOrder,
                                isView: true,
                              );
                            });
                      }
                      return Center(child: CustomSpinner());
                    }),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 32,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      lightColor.withOpacity(0),
                      lightColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
