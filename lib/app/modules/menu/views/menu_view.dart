import 'package:casso/app/data/constant.dart';
import 'package:casso/app/modules/components/widget/search_bar.dart';
import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/modules/menu/views/category/all.dart';
import 'package:casso/app/modules/menu/views/category/food.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_sheet/bottom_sheet.dart';
import 'category/dessert.dart';
import 'category/drink.dart';
import 'components/button_chart.dart';

class Menus extends GetView<MenuController> {
  const Menus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final table = Get.arguments;
    print("args dari tables = ${table + 1}");
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          'MENU',
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
              margin: EdgeInsets.symmetric(horizontal: 8),
              height: 30,
              child: Container(
                padding: const EdgeInsets.all(2),
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
            SearchBar(),
            Expanded(
              child: Stack(
                children: [
                  TabBarView(
                    // physics: NeverScrollableScrollPhysics(),
                    children: [
                      DessertMenu(),
                      DrinkMenu(),
                      FoodMenu(),
                      AllMenu(),
                    ],
                  ),
                  ButtonChart(
                    table: table + 1,
                    onTap: () => Get.bottomSheet(
                      BotomSheet(),
                      barrierColor: Color(0XFF858585).withOpacity(.3),
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
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: 10,
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
