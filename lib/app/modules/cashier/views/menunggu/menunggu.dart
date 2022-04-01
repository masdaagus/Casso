import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:casso/app/modules/cashier/views/menunggu/components/prices_card.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:casso/app/utils/spinner_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/search_box.dart';

class Menunggu extends GetView<CashierController> {
  const Menunggu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: Column(
        children: [
          // card seraching
          SearchBox(),

          // List items dan total
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: controller.initStream('orders'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    List<Order> orderData =
                        snapshot.data!.docs.map((DocumentSnapshot doc) {
                      var dataDoc = doc.data() as Map<String, dynamic>;
                      Order data = Order.fromJson(dataDoc);
                      return data;
                    }).toList();

                    List idDocs = snapshot.data!.docs;
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: orderData.length,
                        itemBuilder: (context, index) {
                          Order data = orderData[index];
                          String id = idDocs[index].id;

                          return PricesCard(
                            data: data,
                          );
                        });
                  }
                  return Center(child: CustomSpinner());
                }),
          ),
        ],
      ),
    );
  }
}
