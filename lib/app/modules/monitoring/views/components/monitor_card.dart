import 'package:casso/app/modules/monitoring/views/components/order_item.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

import 'button_semua.dart';

class MonitorCard extends StatelessWidget {
  const MonitorCard({
    Key? key,
    this.table,
    this.guessName,
    this.orderTime,
    this.orders,
    this.orderButton = 'PROSES',
    this.isOrder = false,
  }) : super(key: key);

  final int? table;
  final String? guessName;
  final String? orderTime;
  final List<String>? orders;

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
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 40,
            decoration: BoxDecoration(
              color: darkColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TABLE ${table} - (${guessName})",
                  style: TextStyle(
                    fontFamily: "balsamiq",
                    color: textColor,
                    fontSize: 12,
                    letterSpacing: .5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${orderTime}",
                  style: TextStyle(
                    fontFamily: "balsamiq",
                    color: textColor,
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
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return OrderItem(
                        isOrder: isOrder,
                        textButton: orderButton,
                        orderName: orders![index],
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
