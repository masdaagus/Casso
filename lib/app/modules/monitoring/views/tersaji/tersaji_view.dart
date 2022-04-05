import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/monitoring/controllers/monitoring_controller.dart';
import 'package:casso/app/modules/monitoring/views/components/card_no_order.dart';
import 'package:casso/app/modules/monitoring/views/components/monitor_card.dart';
import 'package:casso/app/modules/monitoring/views/components/order_item.dart';

import 'package:casso/app/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TersajiMonitoring extends GetView<MonitoringController> {
  const TersajiMonitoring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final List<ProductOrder> productsAdd = [];
    return Scaffold(
      backgroundColor: lightColor,
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: controller.initStream('tersaji'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    List<Order> orderData =
                        snapshot.data!.docs.map((DocumentSnapshot doc) {
                      var dataDoc = doc.data() as Map<String, dynamic>;
                      Order data = Order.fromJson(dataDoc);
                      return data;
                    }).toList();

                    // GET LIST ID DOCS
                    List idDocs = snapshot.data!.docs;
                    if (orderData.length == 0) {
                      return NoOrderWidget();
                    }

                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: orderData.length,
                      itemBuilder: (context, index) {
                        Order data = orderData[index];
                        String id = idDocs[index].id;

                        /// func agar data tidak duplicate
                        List<ProductOrder> productOrders = data.productsOrder!;
                        final ids = Set();
                        productOrders.retainWhere(
                          (x) => ids.add(x.productName),
                        );

                        return MonitorCard(
                          data: data,
                          isOrder: true,
                          isTersaji: true,
                          // buttonAll: () => controller.setProsesAll(data, id),
                          buttonAll: () async {
                            await controller.setProsesAll(
                              data,
                              id,
                              'tersaji',
                              'kosong',
                            );
                          },
                          listOrder: Container(
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.productsOrder!.length,
                              itemBuilder: (context, index) {
                                ProductOrder productOrder =
                                    productOrders[index];

                                return OrderItem(
                                  data: productOrder,
                                  isOrder: false,
                                  isTersaji: true,
                                  onTap: () {
                                    controller.setProses(
                                      data,
                                      id,
                                      productOrder,
                                      'tersaji',
                                      'tersaji',
                                    );
                                  },
                                  textButton: 'tersaji',
                                  undoButton: () => controller.reverseProses(
                                    data,
                                    id,
                                    productOrder,
                                    'siap',
                                    'tersaji',
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
