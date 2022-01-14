import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';

import 'card_terlaris.dart';

class ListTerlaris extends StatelessWidget {
  const ListTerlaris({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CardTerlaris(),
          SizedBox(width: padding),
          CardTerlaris(),
          SizedBox(width: padding),
          CardTerlaris(),
        ],
      ),
    );
  }
}
