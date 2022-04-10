import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class PricesCard extends StatelessWidget {
  const PricesCard({
    Key? key,
    this.onTap,
    this.isDone = false,
    required this.data,
  }) : super(key: key);

  final Order? data;
  final VoidCallback? onTap;
  final bool isDone;

  // @override
//   State<PricesCard> createState() => _PricesCardState();
// }

// class _PricesCardState extends State<PricesCard> {
//   @override
//   void initState() {
//     // _sumPrices();
//     super.initState();
//   }

  // double _total = 0;
  // double _sumPrices() {
  //   _total = 0;
  //   widget.data!.productsOrder!
  //       .forEach((e) => _total += (e.productPrice! * e.productQty));
  //   return _total;
  // }

  @override
  Widget build(BuildContext context) {
    /// [function] agar data tidak duplicate
    List<ProductOrder> productOrders = data!.productsOrder!;
    final ids = Set();
    productOrders.retainWhere(
      (x) => ids.add(x.productName),
    );
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: abu,
      ),
      child: Column(
        children: [
          // THIS HEAD WIDGET
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 32,
            decoration: BoxDecoration(
              color: putih,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TABLE ${data!.tableNumber} - (${data!.guessName})",
                  style: TextStyle(
                    color: darkColor,
                    fontFamily: "balsamiq",
                    fontWeight: FontWeight.bold,
                    letterSpacing: .5,
                    fontSize: 13,
                  ),
                ),
                Text(
                  "By: ${data!.waitersName}",
                  style: TextStyle(
                    color: darkColor,
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
                                      color: darkColor,
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
                                        color: darkColor,
                                        fontFamily: "balsamiq",
                                        fontSize: 14,
                                        letterSpacing: .5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                          ),
                          Text(
                            nf.format(
                                listOrder.productPrice! * listOrder.productQty),
                            style: TextStyle(
                                color: darkColor,
                                fontFamily: "balsamiq",
                                letterSpacing: .5),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: .5,
                        color: darkColor.withOpacity(.5),
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
              color: putih,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TOTAL",
                  style: TextStyle(
                    color: darkColor,
                    fontFamily: "balsamiq",
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    letterSpacing: .5,
                  ),
                ),
                Text(
                  nf.format(data!.totalPrices),
                  style: TextStyle(
                    color: darkColor,
                    fontFamily: "balsamiq",
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    letterSpacing: .5,
                  ),
                ),
              ],
            ),
          ),

          isDone
              ? Container()
              : GestureDetector(
                  onTap: onTap,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    height: 32,
                    width: 120,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0XFFA0B5EB),
                            Color(0XFFC9F0E4),
                            // Color(0XFFDFE9F3),
                            // putih,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: hitam.withOpacity(.2),
                            blurRadius: 4,
                            offset: Offset(4, 4),
                          )
                        ]),
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
                ),
        ],
      ),
    );
  }
}
