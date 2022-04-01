import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/components/search_bar/search_bar.dart';
import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/modules/menu/views/category/all.dart';
import 'package:casso/app/modules/menu/views/category/food.dart';

import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_sheet/bottom_sheet.dart';
import 'category/dessert.dart';
import 'category/drink.dart';
import 'components/button_chart.dart';
import 'components/dialog_cancel.dart';

class Menus extends GetView<MenuController> {
  const Menus({
    Key? key,
    this.data,
    this.guessName,
    this.table,
  }) : super(key: key);

  final Order? data;
  final String? guessName;
  final int? table;

  @override
  Widget build(BuildContext context) {
    print(data!.guessName);
    print(data!.tableNumber);
    print("data = $guessName");
    print("data = $table");
    return WillPopScope(
      onWillPop: () async {
        Get.defaultDialog(
          content: DialogCancel(
            onConfirm: () => controller.deleteTable(table ?? data!.tableNumber),
          ),
          backgroundColor: Colors.transparent,
          titleStyle: TextStyle(color: Colors.transparent),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: darkColor,
        appBar: AppBar(
          backgroundColor: darkColor,
          elevation: 0,
          title: Text(
            'MENU',
            style: TextStyle(
              color: abu,
              fontFamily: "balsamiq",
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
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        DessertMenu(),
                        DrinkMenu(),
                        FoodMenu(),
                        AllMenu(),
                      ],
                    ),
                    ButtonChart(
                      guessName: guessName ?? data!.guessName,
                      table: table ?? data!.tableNumber,
                      onTap: () => Get.bottomSheet(
                        CustomBottomSheet(
                          onTap: () {
                            controller.setOrder(
                                guessName: guessName ?? data!.guessName,
                                table: table ?? data!.tableNumber);
                            // controller.getData(
                            //     guessName: guessName ?? data!.guessName,
                            //     tableNumber: table ?? data!.tableNumber!);
                          },
                        ),
                        isScrollControlled: true,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textTab(String text) {
    return Container(
      height: 28,
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
