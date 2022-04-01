import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PricesCard extends StatefulWidget {
  const PricesCard({
    required this.data,
    Key? key,
    this.onTap,
  }) : super(key: key);

  final Order? data;
  final VoidCallback? onTap;

  @override
  State<PricesCard> createState() => _PricesCardState();
}

class _PricesCardState extends State<PricesCard> {
  @override
  void initState() {
    _sumPrices();
    super.initState();
  }

  double _total = 0;
  double _sumPrices() {
    _total = 0;
    widget.data!.productsOrder!.forEach((e) => _total += e.productPrice!);
    return _total;
  }

  @override
  Widget build(BuildContext context) {
    /// [function] agar data tidak duplicate
    List<ProductOrder> productOrders = widget.data!.productsOrder!;
    final ids = Set();
    productOrders.retainWhere(
      (x) => ids.add(x.productName),
    );
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: lightColor.withOpacity(.1),
      ),
      child: Column(
        children: [
          // THIS HEAD WIDGET
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 32,
            decoration: BoxDecoration(
              color: darkColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TABLE ${widget.data!.tableNumber} - (${widget.data!.guessName})",
                  style: TextStyle(
                    color: abu,
                    fontFamily: "balsamiq",
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                    fontSize: 13,
                  ),
                ),
                Text(
                  "By: ${widget.data!.waitersName}",
                  style: TextStyle(
                    color: abu,
                    fontFamily: "balsamiq",
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: .5,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: productOrders.length,
              itemBuilder: (context, index) {
                ProductOrder listOrder = productOrders[index];
                return Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Text(
                                  listOrder.productName!,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: abu,
                                      fontFamily: "balsamiq",
                                      letterSpacing: .5),
                                ),
                              ),
                              SizedBox(width: 16),
                              if (listOrder.productQty > 1)
                                Container(
                                  child: Text(
                                    "x${listOrder.productQty.toString()}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: orange,
                                      fontFamily: "balsamiq",
                                      fontSize: 12,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Text(
                            nf.format(listOrder.productPrice),
                            style: TextStyle(
                                color: abu,
                                fontFamily: "balsamiq",
                                letterSpacing: .5),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: .5,
                        color: lightColor.withOpacity(.1),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: darkColor.withOpacity(.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TOTAL",
                  style: TextStyle(
                    color: putih,
                    fontFamily: "balsamiq",
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    letterSpacing: .5,
                  ),
                ),
                Text(
                  nf.format(_total),
                  style: TextStyle(
                    color: putih,
                    fontFamily: "balsamiq",
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    letterSpacing: .5,
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 16),
            height: 32,
            width: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: grColor1,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
                child: Text(
              "BAYAR",
              style: TextStyle(
                color: darkColor,
                fontFamily: "balsamiq",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: .5,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
