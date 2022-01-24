import 'package:flutter/material.dart';

import 'card_category.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 24, top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CardCategory(
            tittle: 'Dessert',
            svg: "assets/icons/pizza.svg",
          ),
          CardCategory(
            tittle: 'Drink',
            svg: "assets/icons/coffee.svg",
          ),
          CardCategory(
            pick: true,
            tittle: 'Food',
            svg: "assets/svg/burger.svg",
          ),
        ],
      ),
    );
  }
}
