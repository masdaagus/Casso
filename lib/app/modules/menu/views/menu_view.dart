import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/components/search_bar/search_bar.dart';
import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/modules/menu/views/category/all.dart';
import 'package:casso/app/modules/menu/views/category/food.dart';

import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: lightColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: darkColor,
      statusBarBrightness: Brightness.light,
    ));
    return WillPopScope(
      onWillPop: () async {
        Get.defaultDialog(
          content: DialogCancel(
            onConfirm: () {
              if (guessName != null) {
                controller.deleteTable(table);
              }

              Get.offAllNamed('/home');
            },
          ),
          backgroundColor: Colors.transparent,
          titleStyle: TextStyle(color: Colors.transparent),
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: lightColor,
        appBar: AppBar(
          backgroundColor: darkColor,
          elevation: 0,
          title: Text(
            'MENU',
            style: TextStyle(
              color: lightColor,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
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
                // height: 30,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
                  color: darkColor,
                  // padding: const EdgeInsets.all(2),
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
              GetBuilder<MenuController>(
                builder: (c) {
                  return SearchBar(
                    hint: 'Cari nama produk',
                    onChange: (val) {
                      c.filterProducts(val);
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
                        DessertMenu(),
                        DrinkMenu(),
                        FoodMenu(),
                        AllMenu(),
                      ],
                    ),
                    ButtonChart(
                        guessName: guessName ?? data!.guessName,
                        table: table ?? data!.tableNumber,
                        onTap: () {
                          final dur = Duration(milliseconds: 420);
                          Get.bottomSheet(
                            CustomBottomSheet(
                              guessName: guessName ?? data!.guessName,
                              tableNumber: table ?? data!.tableNumber,
                              onTap: () {
                                controller.setOrder(
                                  guessName: guessName ?? data!.guessName,
                                  table: table ?? data!.tableNumber,
                                );
                              },
                            ),
                            isScrollControlled: true,
                            enterBottomSheetDuration: dur,
                            exitBottomSheetDuration: dur,
                          );
                          // Get.to(ConfirmOrderView());
                        })
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
            color: lightColor,
            fontSize: 12,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
