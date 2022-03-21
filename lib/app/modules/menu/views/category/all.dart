import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/card/product_card/product_card.dart';
import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllMenu extends GetView<MenuController> {
  const AllMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkColor,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: .89,
                physics: BouncingScrollPhysics(),
                children: List.generate(controller.products.length, (index) {
                  ProductOrder data = controller.products[index];

                  return ProductCard(
                    productName: data.productName,
                    productPrice: data.productPrice,
                    addProduct: () async {
                      await controller.addProduct(data);
                    },
                    minProduct: () async {
                      await controller.minProduct(data);
                    },
                    textCount: GetBuilder<MenuController>(
                      builder: (c) {
                        int qty = c.products[index].productQty;
                        if (qty < 0) qty = 0;
                        return Text(
                          qty.toString(),
                          style: TextStyle(
                            color: textColor,
                            fontFamily: 'balsamiq',
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 85),
          ],
        ),
      ),
    );
  }

  Container tittleProduct(String tittle) {
    return Container(
      margin: const EdgeInsets.only(left: 16, bottom: 16),
      height: 24,
      width: Get.width * .3,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0XFFA0B5EB),
          Color(0XFFC9F0E4),
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          tittle,
          style: TextStyle(
            color: darkColor,
            fontFamily: "balsamiq",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
