import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/resto.dart';
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
                children: List.generate(dessert.length, (index) {
                  ProductOrder data = dessert[index];
                  String image = controller.image[index];
                  Product kosong = Product();

                  return ProductCard(
                    data: data,
                    dataProduct: kosong,
                    productImage: image,
                    addProduct: () => controller.addProduct(data),
                    minProduct: () => controller.minProduct(data),
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
