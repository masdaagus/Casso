import 'dart:developer';

import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../transaction/views/transaction_view.dart';
import 'components/card_list_transaction.dart';

class TransactionsView extends GetView<HomeController> {
  const TransactionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 56,
            width: double.infinity,
            color: putih,
            child: Center(
              child: Text(
                "TRANSACTIONS",
                style: TextStyle(
                  color: darkColor,
                  fontFamily: 'Ubuntu',
                  letterSpacing: .5,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 1));
                  await controller.readTransations();
                  await controller.aysncTrx();
                },
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: controller.transactions.length,
                  itemBuilder: (context, index) {
                    return CardListTransaction(
                      transaction: controller.transactions[index],
                      onTap: () {
                        Get.to(TransactionView(
                          trx: controller.transactions[index],
                        ));
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
