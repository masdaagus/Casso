import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ListItemOrder extends GetView<MenuController> {
  const ListItemOrder({
    Key? key,
    this.onTap,
    // required this.data,
  }) : super(key: key);

  // final ProductOrder data;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: .22,
        motion: const ScrollMotion(),
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: lightColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    offset: Offset(3, 3),
                    color: hitam.withOpacity(.25),
                  ),
                  BoxShadow(
                    blurRadius: 3,
                    offset: Offset(-3, -3),
                    color: putih.withOpacity(.75),
                  ),
                ],
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.edit,
                size: 32,
              ),
            ),
          )
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Column(
          children: [
            Container(
              height: 4,
              decoration: BoxDecoration(
                color: putih,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              // height: 56,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: grColor1,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      offset: Offset(0, 3),
                      color: hitam.withOpacity(.15),
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // GetBuilder<MenuController>(
                      //   builder: (_) {
                      //     return Text(
                      //       data.productName!,
                      //       style: TextStyle(
                      //         color: darkColor,
                      //         fontFamily: 'Ubuntu',
                      //         fontSize: 14,
                      //       ),
                      //     );
                      //   },
                      // ),
                      // SizedBox(height: 6),
                      // GetBuilder<MenuController>(
                      //   builder: (_) {
                      //     return Text(
                      //       nf.format(data.productPrice),
                      //       style: TextStyle(
                      //         color: darkColor.withOpacity(.8),
                      //         fontFamily: 'Ubuntu',
                      //         fontSize: 13,
                      //       ),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(),
                  //   child: Row(
                  //     children: [
                  //       ButtonControl(
                  //         icon: Icons.remove,
                  //         onTap: () async {
                  //           await controller.minProduct(data);
                  //         },
                  //       ),
                  //       SizedBox(width: 16),
                  //       GetBuilder<MenuController>(
                  //         builder: (c) {
                  //           int qty = data.productQty;
                  //           if (qty < 0) qty = 0;
                  //           return Text(
                  //             '$qty',
                  //             style: TextStyle(
                  //               color: darkColor,
                  //               fontFamily: 'Ubuntu',
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 16,
                  //             ),
                  //           );
                  //         },
                  //       ),
                  //       ButtonControl(
                  //         icon: Icons.add,
                  //         onTap: () async {
                  //           await controller.addProduct(data);
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonControl extends StatelessWidget {
  const ButtonControl({
    Key? key,
    this.icon,
    this.onTap,
  }) : super(key: key);

  final IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: lightColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: hitam.withOpacity(.25),
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: darkColor,
        ),
      ),
    );
  }
}
