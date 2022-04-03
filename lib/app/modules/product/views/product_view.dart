import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/resto.dart';
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
    Get.put(() => AuthController());
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(
        backgroundColor: darkColor,
        elevation: 0,
        title: Text(
          'PRODUCTS',
          style: TextStyle(
            color: abu,
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 30,
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
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingButton(
                      onTap: () {
                        Product kosong = Product(productPrice: 0);
                        Get.to(
                          () => AddProductView(dataProduct: kosong),
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
            color: abu,
            fontSize: 10,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
