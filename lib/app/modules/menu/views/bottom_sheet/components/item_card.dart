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
      color: lightColor.withOpacity(.15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 4,
                height: 72,
                color: biru,
              ),
              Container(
                margin: const EdgeInsets.only(left: 12, top: 16, bottom: 16),
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
                              color: lightColor,
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
                                color: iconColor,
                                fontFamily: "balsamiq",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 13),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: hitam.withOpacity(.4),
                                width: .5,
                              ),
                              borderRadius: BorderRadius.circular(6),
                              color: lightColor.withOpacity(.5),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.notes_sharp,
                                  size: 12,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "Notes",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
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
                          color: lightColor,
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
        ),
      ),
    );
  }
}
