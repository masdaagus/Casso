import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/product.dart';
import 'package:casso/app/modules/card/product_card/product_card.dart';
import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodMenu extends GetView<MenuController> {
  const FoodMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductOrder> foodOrder = controller.productsOrder
        .where((d) => d.productCategory == 'FOOD')
        .toList();
    List<Product> foodProduct =
        controller.products.where((d) => d.productCategory == 'FOOD').toList();

    return Container(
      color: lightColor,
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
                children: List.generate(foodOrder.length, (index) {
                  ProductOrder data = foodOrder[index];
                  Product product = foodProduct[index];

                  return ProductCard(
                    data: data,
                    dataProduct: product,
                    addProduct: () async {
                      controller.addProduct(data);
                    },
                    minProduct: () async {
                      controller.minProduct(data);
                    },
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
