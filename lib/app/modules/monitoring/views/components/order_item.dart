import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
    required this.onTap,
    required this.data,
    this.undoButton,
    this.isOrder = true,
    this.textButton = 'proses',
    this.isTersaji = false,
  }) : super(key: key);

  final ProductOrder data;
  final String textButton;
  final VoidCallback onTap;
  final VoidCallback? undoButton;
  final bool isOrder;
  final bool isTersaji;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 6),
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      color: darkColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  Container(
                    child: Text(
                      data.productName!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: darkColor,
                        fontFamily: "balsamiq",
                        fontSize: 12,
                        letterSpacing: .5,
                      ),
                    ),
                  ),
                  if (data.productQty > 1)
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: Text(
                        "x${data.productQty.toString()}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: darkColor,
                          fontFamily: "balsamiq",
                          fontSize: 13,
                          letterSpacing: .5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  SizedBox(width: 8),
                  if (data.productNote != null)
                    GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                            radius: 16,
                            title: '${data.productName!.toUpperCase()}',
                            titleStyle: TextStyle(
                              color: darkColor,
                              fontFamily: 'balsamiq',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            middleText: data.productNote!,
                            middleTextStyle: TextStyle(
                              color: darkColor.withOpacity(.7),
                              fontFamily: 'balsamiq',
                              // fontWeight: FontWeight.bold,
                              // fontSize: 20,
                            ));
                      },
                      child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: darkColor.withOpacity(.5),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                              child: Icon(
                            Icons.mail_outline_outlined,
                            size: 13,
                            color: lightColor,
                          ))),
                    )
                ],
              ),
              isTersaji
                  ? Text(
                      nf.format(data.productPrice! * data.productQty),
                      style: TextStyle(
                          color: darkColor,
                          fontSize: 12,
                          fontFamily: "balsamiq",
                          letterSpacing: .5),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        isOrder
                            ? Container()

                            /// BUTTON REVERSE
                            : Container(
                                width: 36,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: darkColor.withOpacity(.7),
                                ),
                                child: GestureDetector(
                                  onTap: undoButton,
                                  child: Icon(
                                    Icons.undo,
                                    size: 14,
                                    color: lightColor,
                                  ),
                                ),
                              ),
                        SizedBox(width: 6),
                        Container(
                          height: 24,
                          child: ElevatedButton(
                            onPressed: onTap,
                            child: Text(
                              textButton.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 9,
                                  fontFamily: "Balsamiq",
                                  letterSpacing: .3,
                                  color: darkColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              primary: lightColor,
                            ),
                          ),
                        ),
                      ],
                    )
            ],
          ),
          Divider(
            thickness: .35,
            color: darkColor.withOpacity(.5),
          ),
        ],
      ),
    );
  }
}
