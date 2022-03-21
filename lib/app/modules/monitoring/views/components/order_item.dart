import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
    required this.orderName,
    required this.textButton,
    required this.onTap,
    required this.isOrder,
  }) : super(key: key);

  final String orderName;
  final String textButton;
  final VoidCallback onTap;
  final bool isOrder;

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
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 6),
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      color: textColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  Container(
                    child: Text(
                      orderName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textColor.withOpacity(.9),
                        fontFamily: "balsamiq",
                        fontSize: 12,
                        letterSpacing: .5,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  isOrder
                      ? Container()
                      : Container(
                          width: 48,
                          height: 20,
                          child: ElevatedButton(
                            onPressed: onTap,
                            child: Icon(Icons.undo, size: 16),
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              primary: purple.withOpacity(.5),
                            ),
                          ),
                        ),
                  SizedBox(width: 4),
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
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        primary: putih.withOpacity(.2),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Divider(
            thickness: .3,
            color: textColor.withOpacity(.3),
          ),
        ],
      ),
    );
  }
}
