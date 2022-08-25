import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard_controller.dart';

class TopCard extends StatelessWidget {
  const TopCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      height: 90,
      child: Row(
        children: [
          // GetBuilder<DashboardController>(
          //   builder: (c) {
          //     return CardDetail(value: nf.format(c.totalPenjualan.value));
          //   },
          // ),
          SizedBox(width: 16),
          // GetBuilder<DashboardController>(
          //   builder: (c) {
          //     ProductOrder data = c.bestNo1 ?? c.nullData;
          //     return CardDetail(
          //       tittle: 'Produk Terlaris',
          //       value: data.productName ?? 'Belum ada produk',
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}

class CardDetail extends StatelessWidget {
  const CardDetail({
    Key? key,
    this.tittle = 'Total Penjualan',
    this.value = "Belum ada data",
  }) : super(key: key);

  final String tittle;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
        height: 80,
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: darkColor.withOpacity(.25),
                offset: Offset(4, 4),
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tittle,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Ubuntu",
                fontSize: 12,
                color: textDark,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "$value",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Ubuntu",
                fontSize: 16,
                color: darkColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
