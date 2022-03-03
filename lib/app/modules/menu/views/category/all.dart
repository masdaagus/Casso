import 'package:casso/app/data/models/products.dart';
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
                children: List.generate(controller.allProducts.length, (index) {
                  ProductCategory product = controller.allProducts[index];
                  int countProduct = 0;
                  return ProductCard(
                    productName: product.foodName,
                    productPrice: product.foodPrice,
                    productCount: countProduct,
                    addProduct: () {
                      controller.tempOrder.add(ProductCategory(
                        foodName: product.foodName,
                        foodPrice: product.foodPrice,
                        foodCount: countProduct + 1,
                      ));

                      print(controller.tempOrder.length);
                    },
                  );
                }),
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
