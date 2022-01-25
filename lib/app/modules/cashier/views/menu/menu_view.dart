import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/button_chart.dart';
import 'components/category.dart';
import 'components/menu_card.dart';
import 'components/search_button.dart';

class Menus extends StatelessWidget {
  const Menus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Categories(),
          SearchButton(),
          Expanded(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 3,
                    childAspectRatio: .518,
                    physics: BouncingScrollPhysics(),
                    children: List.generate(12, (index) {
                      return MenuCard(
                        tittle: 'Makanan',
                        harga: nf.format(21000),
                        image: "assets/images/milkshake-oreo.jpg",
                      );
                    }),
                  ),
                ),
                ButtonChart()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
