import 'package:casso/app/data/constant.dart';
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
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              orderName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: putih.withOpacity(.9),
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
          Row(
            children: [
              isOrder
                  ? Container()
                  : Container(
                      width: 48,
                      height: 24,
                      child: ElevatedButton(
                        onPressed: onTap,
                        child: Icon(Icons.undo, size: 16),
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          primary: orange.withOpacity(.6),
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
                      fontSize: 10,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w500,
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
    );
  }
}
