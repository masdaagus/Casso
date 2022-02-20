import 'package:casso/app/data/constant.dart';
import 'package:casso/app/modules/components/widget/search_bar.dart';
import 'package:casso/app/modules/product/add-product/add_product.dart';
import 'package:casso/app/modules/product/views/components/floating_button.dart';
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
    // final table = Get.arguments;
    // // print("args dari tables = ${table + 1}");
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          'PRODUCTS',
          style: TextStyle(
            color: textColor,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20),
          onPressed: Get.back,
        ),
      ),
      body: DefaultTabController(
        initialIndex: 3,
        length: 4,
        child: Column(
          children: [
            // Categories(),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 8),
              // height: 30,
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: putih.withOpacity(.2),
                ),
                tabs: [
                  textTab("Dessert"),
                  textTab("Drink"),
                  textTab("Food"),
                  textTab("ALL"),
                ],
              ),
            ),
            SearchBar(),
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
                  FloatingButton(
                    onTap: () => Get.to(
                      () => AddProductView(),
                      transition: Transition.cupertino,
                      duration: Duration(milliseconds: 400),
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
            color: textColor,
            fontSize: 10,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
