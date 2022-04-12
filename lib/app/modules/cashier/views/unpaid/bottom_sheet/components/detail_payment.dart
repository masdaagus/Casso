import 'package:casso/app/modules/cashier/views/unpaid/bottom_sheet/components/total_item.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardDetailPayment extends StatelessWidget {
  const CardDetailPayment({
    Key? key,
    required this.total,
    required this.taxes,
  }) : super(key: key);

  final double total;
  final double taxes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 250,
      width: Get.width - 32,
      decoration: BoxDecoration(
        color: abu,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SizedBox(height: 68),
          Text(
            "DETAIL PEMBAYARAN",
            style: TextStyle(
              color: darkColor,
              fontFamily: 'balsamiq',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: .5,
            ),
          ),
          SizedBox(height: 24),
          TotalItem(total: total),
          TotalItem(
            tittle: 'PAJAK (${taxes.toStringAsFixed(0)}%)',
            total: total * taxes / 100,
          ),
          Divider(
            thickness: 2,
            color: darkColor.withOpacity(.2),
          ),
          SizedBox(height: 8),
          TotalItem(
            tittle: 'GRAND TOTAL',
            isGrand: true,
            total: (total * taxes / 100) + total,
          ),
        ],
      ),
    );
  }
}
