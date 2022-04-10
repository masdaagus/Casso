import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/monitoring/controllers/monitoring_controller.dart';
import 'package:casso/app/modules/monitoring/views/components/card_no_order.dart';
import 'package:casso/app/modules/monitoring/views/components/monitor_card.dart';
import 'package:casso/app/modules/monitoring/views/components/order_item.dart';

import 'package:casso/app/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PesananMonitoring extends GetView<MonitoringController> {
  const PesananMonitoring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: controller.initStream('pesanan'),
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

                        /// [function] agar data tidak duplicate
                        List<ProductOrder> productOrders = data.productsOrder!;
                        final ids = Set();
                        productOrders.retainWhere(
                          (x) => ids.add(x.productName),
                        );
                        bool _isWaiters = false;
                        String status = controller.user.value.status!;
                        if (status == 'WAITERS' || status == 'OWNER') {
                          _isWaiters = true;
                        }

                        return MonitorCard(
                          data: data,
                          isOrder: true,
                          isWaiters: _isWaiters,
                          buttonAll: () => controller.setProsesAll(
                            data,
                            id,
                            'pesanan',
                            'proses',
                          ),
                          delete: () {
                            controller.deleteOrder(data, id);
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
                                  onTap: () {
                                    controller.setProses(
                                      data,
                                      id,
                                      productOrder,
                                      'pesanan',
                                      'proses',
                                    );
                                  },
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
