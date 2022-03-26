import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

import 'button_semua.dart';
import 'order_item.dart';

class MonitorCard extends StatelessWidget {
  const MonitorCard({
    Key? key,
    this.orderButton = 'PROSES',
    this.isOrder = false,
    required this.data,
  }) : super(key: key);

  final Order data;
  final String orderButton;
  final bool isOrder;

  @override
  Widget build(BuildContext context) {
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
                    itemCount: data.productsOrder!.toSet().toList().length,
                    itemBuilder: (context, index) {
                      ProductOrder dataOrder =
                          data.productsOrder!.toSet().toList()[index];

                      return OrderItem(
                        isOrder: isOrder,
                        textButton: orderButton,
                        qty: dataOrder.productQty,
                        orderName: dataOrder.productName!,
                        onTap: () {},
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
            onTap: () {},
          )
        ],
      ),
    );
  }
}
