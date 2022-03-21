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
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: lightColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
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
                        var price = data.productPrice;
                        if (price! < 0) {
                          price = 0;
                        }

                        return Text(
                          "${nf.format(price)}",
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
                      onTap: () {
                        print("tap notes");
                        print(data.productName);
                        print(data.productPrice);
                        print(data.productQty);
                      },
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
          Container(
            child: Row(
              children: [
                addAndRemoveButton(Icons.add, () async {
                  controller.addProduct(data);
                }),
                GetBuilder<MenuController>(
                  builder: (_) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "${data.productQty}",
                        style: TextStyle(
                          color: iconColor,
                          fontFamily: "balsamiq",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
                addAndRemoveButton(Icons.remove, () {
                  controller.minProduct(data);
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
        decoration: BoxDecoration(
          border: Border.all(color: iconColor, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
