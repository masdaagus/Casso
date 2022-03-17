import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/card/product_card/product_card.dart';
import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DessertMenu extends GetView<MenuController> {
  const DessertMenu({Key? key}) : super(key: key);

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
                children: List.generate(controller.dessert.length, (index) {
                  ProductOrder data = controller.dessert[index];

                  return ProductCard(
                    productName: data.productName,
                    productPrice: data.productPrice,
                    addProduct: () async {
                      data.productQty++;
                      await controller.addProduct(data);
                      controller.update();
                    },
                    minProduct: () async {
                      data.productQty--;
                      await controller.minProduct(data);
                      controller.update();
                    },
                    detailProduct: () {},
                    textCount: GetBuilder<MenuController>(
                      builder: (c) {
                        int qty = c.dessert[index].productQty;
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
            SizedBox(height: 65),
          ],
        ),
      ),
    );
  }
}
