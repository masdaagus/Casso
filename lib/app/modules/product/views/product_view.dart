import 'package:casso/app/data/models/product.dart';
import 'package:casso/app/modules/components/floating_button/floating_button.dart';
import 'package:casso/app/modules/components/search_bar/search_bar.dart';
import 'package:casso/app/modules/product/add-product/add_product.dart';

import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';
import 'category/all.dart';
import 'category/dessert.dart';
import 'category/drink.dart';
import 'category/food.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    Get.put(() => ProductController());
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: lightColor,
        elevation: 0,
        title: Text(
          'PRODUCTS',
          style: TextStyle(
            color: darkColor,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: darkColor,
          ),
          onPressed: Get.back,
        ),
      ),
      body: DefaultTabController(
        initialIndex: 3,
        length: 4,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 30,
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: hitam.withOpacity(.2),
                ),
                tabs: [
                  textTab("Dessert"),
                  textTab("Drink"),
                  textTab("Food"),
                  textTab("ALL"),
                ],
              ),
            ),
            GetBuilder<ProductController>(
              builder: (c) {
                return SearchBar(
                  onChange: (val) {
                    c.filterAllProducts(val);
                  },
                );
              },
            ),
            Expanded(
              child: Stack(
                children: [
                  TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      DessertProduct(),
                      DrinkProduct(),
                      FoodProduct(),
                      ProductsView(),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingButton(
                      onTap: () {
                        Product kosong = Product(productPrice: 0);
                        Get.to(
                          () => AddProductView(dataProduct: kosong),
                          transition: Transition.cupertinoDialog,
                          duration: Duration(milliseconds: 500),
                        );
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textTab(String text) {
    return Container(
      height: 30,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: darkColor,
            fontSize: 10,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
