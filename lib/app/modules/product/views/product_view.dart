import 'package:casso/app/data/models/product.dart';
import 'package:casso/app/modules/components/floating_button/floating_button.dart';
import 'package:casso/app/modules/components/search_bar/search_bar.dart';
import 'package:casso/app/modules/product/add-product/add_product.dart';

import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';
import 'category/all.dart';
import 'category/dessert.dart';
import 'category/drink.dart';
import 'category/food.dart';

class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: lightColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: darkColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));
    Get.put(() => ProductController());
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: darkColor,
        elevation: 0,
        title: Text(
          'PRODUCTS',
          style: TextStyle(
            color: lightColor,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: lightColor,
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
              padding: EdgeInsets.all(8),
              color: darkColor,
              child: Container(
                padding: const EdgeInsets.all(4),
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
      height: 24,
      padding: const EdgeInsets.only(top: 2),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: lightColor,
            fontSize: 10,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
