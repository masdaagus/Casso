import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
      // color: orange.withOpacity(.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Categories(),
          SearchButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuCard(
                tittle: "Milkshake Coklat",
                image: "assets/images/milkshake-salak.jpg",
                harga: 23000,
              ),
              MenuCard(
                tittle: "Milkshake Coklat",
                image: "assets/images/milkshake-oreo.jpg",
                harga: 23000,
              ),
              MenuCard(
                tittle: "Milkshake Coklat",
                image: "assets/images/gambar-milkshake.png",
                harga: 23000,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
