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
    List<ProductOrder> dessert = controller.products
        .where((d) => d.productCategory == 'DESSERT')
        .toList();
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
                children: List.generate(dessert.length, (index) {
                  ProductOrder data = dessert[index];

                  return ProductCard(
                    data: data,
                    // productName: data.productName,
                    // productPrice: data.productPrice,
                    addProduct: () async {
                      await controller.addProduct(data);
                    },
                    minProduct: () async {
                      await controller.minProduct(data);
                    },

                    // textCount: GetBuilder<MenuController>(
                    //   builder: (_) {
                    //     int qty = dessert[index].productQty;
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
