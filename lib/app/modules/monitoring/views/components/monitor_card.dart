import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/monitoring/controllers/monitoring_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button_semua.dart';
import 'order_item.dart';

class MonitorCard extends GetView<MonitoringController> {
  const MonitorCard({
    Key? key,
    required this.data,
    required this.id,
    this.orderButton = 'PROSES',
    this.isOrder = false,
    this.buttonAll,
  }) : super(key: key);

  final Order data;
  final String id;
  final String orderButton;
  final bool isOrder;

  final VoidCallback? buttonAll;

  @override
  Widget build(BuildContext context) {
    List<ProductOrder> productsAdd = [];
    final List<ProductOrder> productOrders = data.productsOrder!;
    final ids = Set();
    productOrders.retainWhere((x) => ids.add(x.productName));

    return Container(
      margin: const EdgeInsets.only(left: 16, bottom: 8, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: lightColor.withOpacity(.1),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 24,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: grColor2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TABLE ${data.tableNumber} - (${data.guessName})",
                  style: TextStyle(
                    fontFamily: "balsamiq",
                    color: darkColor,
                    fontSize: 12,
                    letterSpacing: .5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${data.waitersName}",
                  style: TextStyle(
                    fontFamily: "balsamiq",
                    color: darkColor,
                    fontSize: 12,
                    letterSpacing: .5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.productsOrder!.length,
                    itemBuilder: (context, index) {
                      ProductOrder productOrder = productOrders[index];

                      return OrderItem(
                        isOrder: isOrder,
                        textButton: orderButton,
                        data: productOrder,
                        onTap: () {
                          productsAdd.add(productOrder);
                          productsAdd.forEach((element) {
                            print(element.productName);
                          });

                          print("productOrder ${productOrder.productName}");
                          controller.setProses(
                              data, id, productsAdd, productOrder);
                        },
                        undoButton: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Button Prosses semua
          ButtonAll(
            tittleButton: "${orderButton.toUpperCase()} SEMUA",
            onTap: buttonAll!,
          ),
          SizedBox(height: 8)
        ],
      ),
    );
  }
}
