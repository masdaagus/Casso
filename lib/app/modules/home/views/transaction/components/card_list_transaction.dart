import 'package:casso/app/data/model/transaction_model.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constant.dart';

class CardListTransaction extends StatelessWidget {
  const CardListTransaction({
    Key? key,
    this.onTap,
    required this.transaction,
  }) : super(key: key);

  final TransactionModel transaction;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListTile(
          title: Text(
            "RM ${transaction.totalPrices}",
            style: TextStyle(
              color: darkColor.withOpacity(.8),
              letterSpacing: .5,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Icon(Icons.payment),
          subtitle: Text(
            "${transaction.productsTransaction![0].productName!}...",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${hf.format(DateTime.parse(transaction.createAt!))}",
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    "${df.format(DateTime.parse(transaction.createAt!))}",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
        ),
      ),
    );
  }
}
