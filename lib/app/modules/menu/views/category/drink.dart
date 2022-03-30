import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/card/product_card/product_card.dart';
import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrinkMenu extends GetView<MenuController> {
  const DrinkMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductOrder> drink =
        controller.products.where((d) => d.productCategory == 'DRINK').toList();
    return Container(
      color: darkColor,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                addSemanticIndexes: false,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: .89,
                physics: BouncingScrollPhysics(),
                children: List.generate(drink.length, (index) {
                  ProductOrder data = drink[index];

                  return ProductCard(
                    data: data,
                    addProduct: () async {
                      await controller.addProduct(data);
                    },
                    minProduct: () async {
                      await controller.minProduct(data);
                    },
                    // textCount: GetBuilder<MenuController>(
                    //   builder: (_) {
                    //     int qty = drink[index].productQty;
                    //     if (qty < 0) qty = 0;
                    //     return Text(
                    //       qty.toString(),
                    //       style: TextStyle(
                    //         color: textColor,
                    //         fontFamily: 'balsamiq',
                    //       ),
                    //     );
                    //   },
                    // ),
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
