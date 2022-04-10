import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemCardBottomSheet extends GetView<MenuController> {
  const ItemCardBottomSheet({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ProductOrder data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
        left: 24,
        right: 24,
      ),
      child: Column(
        children: [
          Container(
            color: abu,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 4,
                      height: 68,
                      color: biru,
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 12, top: 8, bottom: 8),
                      width: Get.width * .48,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GetBuilder<MenuController>(
                            builder: (_) {
                              return Text(
                                data.productName!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    color: darkColor,
                                    fontFamily: "balsamiq",
                                    letterSpacing: 1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              GetBuilder<MenuController>(
                                builder: (_) {
                                  return Text(
                                    "${nf.format(data.productPrice)}",
                                    style: TextStyle(
                                      color: darkColor.withOpacity(.7),
                                      fontFamily: "balsamiq",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(width: 13),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: Row(
                    children: [
                      addAndRemoveButton(Icons.remove, () {
                        controller.minProduct(data);
                      }),
                      GetBuilder<MenuController>(
                        builder: (c) {
                          int qty = data.productQty;
                          if (qty < 0) qty = 0;
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "${qty}",
                              style: TextStyle(
                                color: darkColor,
                                fontFamily: "balsamiq",
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                      addAndRemoveButton(Icons.add, () async {
                        controller.addProduct(data);
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 16, top: 0, right: 4, bottom: 0),
            width: Get.width,
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(8),
              ),
            ),
            child: TextField(
              onChanged: (value) => data.productNote = value,
              style: TextStyle(
                color: darkColor,
                fontFamily: 'balsamiq',
                fontSize: 12,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                labelText: "Catatan Order",
                hintText: 'Tulis catatan order di sini',
                labelStyle: TextStyle(
                  color: darkColor.withOpacity(.7),
                  fontFamily: 'balsamiq',
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget addAndRemoveButton(IconData icon, VoidCallback ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: darkColor.withOpacity(.8),
        ),
        child: Icon(
          icon,
          color: lightColor,
          size: 20,
        ),
      ),
    );
  }
}
