import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/products.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/modules/card/product_card/product_card.dart';
import 'package:casso/app/modules/product/add-product/add_product.dart';

import 'package:casso/app/modules/product/controllers/product_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DessertProduct extends GetView<ProductController> {
  const DessertProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> dessert = controller.products
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
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                childAspectRatio: .89,
                physics: BouncingScrollPhysics(),
                children: List.generate(dessert.length, (index) {
                  Product data = dessert[index];
                  String image = controller.image[index];

                  ProductOrder kosong = ProductOrder();
                  return ProductCard(
                    dataProduct: data,
                    data: kosong,
                    isOrderWidget: false,
                    productImage: image,
                    editProduct: () {
                      // Get.to(() => AddProductView(
                      //       dataProduct: data,
                      //       image: image,
                      //     ));
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
