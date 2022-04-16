import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonChart extends GetView<MenuController> {
  const ButtonChart({
    Key? key,
    this.table,
    this.onTap,
    this.guessName = 'TAKE AWAY',
  }) : super(key: key);

  final int? table;

  final String? guessName;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // List<ProductOrder>? productsOrder =
    //     controller.order.value.productsOrder as List<ProductOrder>;

    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: [
            Container(
              height: 110,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [lightColor.withOpacity(0), lightColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 40,
                left: 64,
                right: 64,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
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
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    offset: Offset(4, 4),
                    color: hitam.withOpacity(.35),
                  ),
                  BoxShadow(
                    blurRadius: 8,
                    offset: Offset(-4, -4),
                    color: putih.withOpacity(.10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<MenuController>(
                        builder: (c) {
                          var a = c.productsOrder
                              .where((e) => e.productQty != 0)
                              .toList();
                          int items = 0;

                          a.forEach((data) {
                            items += data.productQty;
                          });

                          // var items = c.order.value.productsOrder!.length;

                          if (items < 0) {
                            items = 0;
                          }

                          return Text(
                            "${items} Items",
                            style: TextStyle(
                              color: darkColor,
                              fontFamily: "balsamiq",
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Table ${table} - (${guessName})",
                        style: TextStyle(
                          color: darkColor,
                          fontFamily: "balsamiq",
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(() => Text(
                            nf.format(controller.order.value.totalPrices),
                            style: TextStyle(
                              color: darkColor,
                              fontFamily: "balsamiq",
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(width: 6),
                      Icon(
                        Icons.shopping_cart_sharp,
                        color: darkColor,
                        size: 20,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
