import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'card_best_product.dart';

class BestProduct extends StatelessWidget {
  const BestProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 32, right: 16),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: darkColor.withOpacity(.15),
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "3 Produk Terlaris",
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GetBuilder<DashboardController>(
                  builder: (c) {
                    ProductOrder data = c.bestNo1 ?? c.nullData;
                    return CardBestProduct(
                      productName: data.productName ?? 'Belum ada produk',
                      productPrice: data.productPrice ?? 0,
                      productQty: data.productQty,
                    );
                  },
                ),
                GetBuilder<DashboardController>(
                  builder: (c) {
                    // ProductOrder data = c.bestProduct[1];
                    ProductOrder data = c.bestNo2 ?? c.nullData;
                    return CardBestProduct(
                      productName: data.productName ?? 'Belum ada produk',
                      productPrice: data.productPrice ?? 0,
                      productQty: data.productQty,
                    );
                  },
                ),
                GetBuilder<DashboardController>(
                  builder: (c) {
                    ProductOrder data = c.bestNo3 ?? c.nullData;
                    return CardBestProduct(
                      productName: data.productName ?? 'Belum ada produk',
                      productPrice: data.productPrice ?? 0,
                      productQty: data.productQty,
                    );
                  },
                ),
                // CardBestProduct(),
                // CardBestProduct(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
