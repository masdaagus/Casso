import 'package:casso/app/data/constant.dart';
import 'package:casso/app/modules/monitoring/views/components/order_item.dart';
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
      margin: const EdgeInsets.only(left: 8, bottom: 8, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [putih.withOpacity(.25), putih.withOpacity(.15)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(color: putih.withOpacity(.5)),
              color: primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TABLE ${table} - (${guessName})",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: textColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${orderTime}",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: textColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: putih.withOpacity(.5), width: .5),
              borderRadius: BorderRadius.circular(16),
            ),
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
