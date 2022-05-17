import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/monitoring/controllers/monitoring_controller.dart';
import 'package:casso/app/modules/monitoring/views/components/card_no_order.dart';
import 'package:casso/app/modules/monitoring/views/components/monitor_card.dart';
import 'package:casso/app/modules/monitoring/views/components/order_item.dart';

import 'package:casso/app/utils/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/notification_controller.dart';

class ProsesMonitoring extends GetView<MonitoringController> {
  const ProsesMonitoring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notification = Get.put(NotificationController());
    return Scaffold(
      backgroundColor: lightColor,
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: controller.initStream('proses'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    List<Order> orderData =
                        snapshot.data!.docs.map((DocumentSnapshot doc) {
                      var dataDoc = doc.data() as Map<String, dynamic>;
                      Order data = Order.fromJson(dataDoc);
                      return data;
                    }).toList();

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
                        String status = controller.user.value.status!;
                        bool getAcses;

                        String table = data.tableNumber.toString();
                        String guess = data.guessName!.toUpperCase();

                        switch (status) {
                          case 'OWNER':
                            getAcses = true;
                            break;
                          case 'CASHIER':
                            getAcses = true;
                            break;
                          case 'KITCHEN':
                            getAcses = true;
                            break;
                          default:
                            getAcses = false;
                            break;
                        }

                        return MonitorCard(
                          data: data,
                          isOrder: false,
                          orderButton: 'siap',
                          buttonAll: () {
                            if (getAcses) {
                              controller.setProsesAll(
                                  data, id, 'proses', 'siap');
                              notification.payloadNotification(
                                  tittle: 'ORDER SELESAI',
                                  body:
                                      'Pesanan $guess meja $table siap diantar');
                            } else {
                              Get.snackbar(
                                status,
                                "DON'T HAVE ACCSES",
                              );
                            }
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
                                    if (getAcses) {
                                      controller.setProses(
                                        data,
                                        id,
                                        productOrder,
                                        'proses',
                                        'siap',
                                      );

                                      notification.payloadNotification(
                                          tittle: 'ORDER SELESAI',
                                          body:
                                              '${productOrder.productName} $guess meja $table siap diantar');
                                    } else {
                                      Get.snackbar(
                                        status,
                                        "DON'T HAVE ACCSES",
                                      );
                                    }
                                  },
                                  isOrder: false,
                                  textButton: 'siap',
                                  undoButton: () {
                                    if (getAcses) {
                                      controller.reverseProses(
                                        data,
                                        id,
                                        productOrder,
                                        'pesanan',
                                        'proses',
                                      );
                                    } else {
                                      Get.snackbar(
                                        status,
                                        "DON'T HAVE ACCSES",
                                      );
                                    }
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
