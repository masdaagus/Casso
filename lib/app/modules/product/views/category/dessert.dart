import 'package:casso/app/data/models/products.dart';
import 'package:casso/app/modules/card/product_card/product_card.dart';

import 'package:casso/app/modules/product/controllers/product_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DessertProduct extends GetView<ProductController> {
  const DessertProduct({Key? key}) : super(key: key);

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
                crossAxisCount: 3,
                childAspectRatio: .55,
                physics: BouncingScrollPhysics(),
                children: List.generate(12, (index) {
                  ProductCategory product =
                      controller.resto.value.products!.dessert![index];
                  return ProductCard(
                    productCount: 1,
                    productName: product.foodName,
                    productPrice: product.foodPrice,
                    productImage: controller.image[index],
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
