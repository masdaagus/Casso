import 'package:casso/app/data/model/transaction_model.dart';
import 'package:casso/app/modules/transaction/views/widgets/card_and_receipt.dart';
import 'package:casso/app/modules/transaction/views/widgets/payment_and_date.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/transaction_controller.dart';
import 'widgets/item_transaction.dart';

class TransactionView extends GetView<TransactionController> {
  const TransactionView({this.trx});
  final TransactionModel? trx;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lightColor,
          elevation: 0,
          title: Text(
            'Detail Transaction',
            style: TextStyle(color: darkColor),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back_ios, color: darkColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              PaymentAndDate(
                  date: dateFormat.format(DateTime.parse(trx!.createAt!))),
              CardAndReceipt(
                total: "RM ${trx!.totalPrices!.toStringAsFixed(0)}",
                receiipt: trx!.transactionId!,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "ITEMS AND SERVICES",
                      style: TextStyle(
                        color: textDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Divider(color: darkColor.withOpacity(.5)),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: trx!.productsTransaction!.length,
                        itemBuilder: (context, index) {
                          var item = trx!.productsTransaction![index];
                          return ItemTransaction(
                            img: item.productImage,
                            itemName: item.productName ?? 'P',
                            price: item.productPrice ?? 0,
                          );
                        }),
                    Divider(color: darkColor.withOpacity(.5)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "TOTAL",
                      style: TextStyle(
                        color: textDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Divider(color: darkColor.withOpacity(.5)),
                    _Subtotal(ammount: trx!.totalPrices ?? 0),
                    Divider(color: darkColor.withOpacity(.5)),
                    _Subtotal(isSub: false, ammount: trx!.totalPrices ?? 0),
                    Divider(color: darkColor.withOpacity(.5)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class _Subtotal extends StatelessWidget {
  const _Subtotal({
    Key? key,
    this.isSub = true,
    required this.ammount,
  }) : super(key: key);

  final bool isSub;
  final double ammount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              color: textDark,
              child: Icon(
                Icons.all_inbox,
                color: lightColor,
              ),
            ),
            SizedBox(width: 8),
            Text(
              isSub ? "Subtotal" : "TOTAL",
              style: TextStyle(
                color: darkColor.withOpacity(.8),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Text(
          "RM $ammount",
          style: TextStyle(
            color: darkColor.withOpacity(.6),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
