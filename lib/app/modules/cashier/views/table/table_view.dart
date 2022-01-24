import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/card_table.dart';

class Tables extends StatelessWidget {
  const Tables({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, top: 24, right: 24),
      child: Column(
        children: [
          Container(
            height: Get.height - 178,
            width: Get.width,
            child: GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 3,
              childAspectRatio: .85,
              physics: BouncingScrollPhysics(),
              children: List.generate(19, (index) {
                return CardTable(
                  tableNumber: index + 1,
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
