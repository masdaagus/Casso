import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/modules/home/views/home_view/bottom_sheet/bottom_sheet.dart';
import 'package:casso/app/modules/home/views/home_view/tabs/keypad/keypad_tab.dart';
import 'package:casso/app/modules/home/views/home_view/tabs/products/products_tab.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/button_charge.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();

    return SafeArea(
        child: DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: darkColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: putih.withOpacity(1),
              ),
              tabs: [
                Container(
                  height: 32,
                  child: Center(
                    child: Text(
                      "Keypad",
                      style: TextStyle(color: darkColor),
                    ),
                  ),
                ),
                Container(
                  height: 32,
                  child: Center(
                    child: Text(
                      "Products",
                      style: TextStyle(color: darkColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: BouncingScrollPhysics(),
              children: [
                KeypadTab(),
                ProductTab(),
              ],
            ),
          ),
          ButtonCharge(
            onTap: () async {
              Get.bottomSheet(
                CustomBottomSheet(),
                isScrollControlled: true,
              );
            },
          ),
        ],
      ),
    ));
  }
}
