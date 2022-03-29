import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/monitoring/controllers/monitoring_controller.dart';
import 'package:casso/app/modules/monitoring/views/components/monitor_card.dart';
import 'package:casso/app/modules/monitoring/views/components/order_item.dart';

import 'package:casso/app/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SiapMonitoring extends GetView<MonitoringController> {
  const SiapMonitoring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: controller.initStream('siap'),
                builder: (context, snapshot) {
                  print(snapshot);
                  if (snapshot.connectionState == ConnectionState.active) {
                    List<Order> orderData =
                        snapshot.data!.docs.map((DocumentSnapshot doc) {
                      var dataDoc = doc.data() as Map<String, dynamic>;
                      Order data = Order.fromJson(dataDoc);
                      print(data);
                      return data;
                    }).toList();

                    List idDocs = snapshot.data!.docs;

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

                        print(data.productsOrder!.length);
                        return MonitorCard(
                          data: data,
                          isOrder: false,
                          orderButton: 'tersaji',
                          buttonAll: () => controller.setProsesAll(
                            data,
                            id,
                            'siap',
                            'tersaji',
                          ),
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
                                      'siap',
                                      'tersaji',
                                    );
                                  },
                                  isOrder: false,
                                  textButton: 'tersaji',
                                  undoButton: () => controller.reverseProses(
                                    data,
                                    id,
                                    productOrder,
                                    'proses',
                                    'siap',
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
