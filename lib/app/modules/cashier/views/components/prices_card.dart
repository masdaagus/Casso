import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/cashier/controllers/cashier_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PricesCard extends GetView<CashierController> {
  const PricesCard({
    Key? key,
    this.onTap,
    this.delete,
    this.textField,
    this.isPaid = false,
    this.isPayment = false,
    required this.data,
  }) : super(key: key);

  final Order? data;
  final VoidCallback? onTap;
  final VoidCallback? delete;
  final bool isPaid;
  final bool? isPayment;

  final Widget? textField;

  @override
  Widget build(BuildContext context) {
    /// [function] agar data tidak duplicate
    List<ProductOrder> productOrders = data!.productsOrder!;
    // final ids = Set();
    // productOrders.retainWhere(
    //   (x) => ids.add(x.productName),
    // );
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: abu,
      ),
      child: Stack(
        children: [
          Column(
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
                      "TABLE ${data!.tableNumber} - (${data!.guessName})",
                      style: TextStyle(
                        color: lightColor,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.bold,
                        // letterSpacing: .5,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      "By: ${data!.waitersName}",
                      style: TextStyle(
                        color: lightColor,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        // letterSpacing: .5,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
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
                                          fontFamily: "Ubuntu",
                                          fontWeight: FontWeight.w600),
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
                                          fontFamily: "Ubuntu",
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Text(
                                nf.format(listOrder.productPrice! *
                                    listOrder.productQty),
                                style: TextStyle(
                                  color: darkColor,
                                  fontFamily: "Ubuntu",
                                  fontWeight: FontWeight.w600,
                                ),
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
              if (controller.resto.value.restoTaxes != 0 &&
                  isPaid &&
                  isPayment != true)
                Container(
                  margin: const EdgeInsets.only(left: 22, right: 24, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "PAJAK ${controller.resto.value.restoTaxes!.toStringAsFixed(0)}%",
                        style: TextStyle(
                          color: darkColor,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          letterSpacing: .5,
                        ),
                      ),
                      Text(
                        "${nf.format((data!.totalPrices! * controller.resto.value.restoTaxes!) / 100)}",
                        style: TextStyle(
                          color: darkColor,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          letterSpacing: .5,
                        ),
                      ),
                    ],
                  ),
                ),

              Container(
                margin: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        letterSpacing: .5,
                      ),
                    ),
                    Text(
                      nf.format(data!.totalPrices),
                      style: TextStyle(
                        color: darkColor,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        letterSpacing: .5,
                      ),
                    ),
                  ],
                ),
              ),

              isPaid
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
                              fontFamily: "Ubuntu",
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: .5,
                            ),
                          ),
                        ),
                      ),
                    ),
              textField ?? Container(),
            ],
          ),
          isPaid
              ? Container()
              : Positioned(
                  bottom: 8,
                  left: 8,
                  child: IconButton(
                    onPressed: delete,
                    icon: Icon(
                      Icons.delete_rounded,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
