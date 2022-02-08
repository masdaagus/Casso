import 'package:casso/app/data/constant.dart';
import 'package:casso/app/modules/menu/views/components/menu_card.dart';
import 'package:flutter/material.dart';

class DrinkMenu extends StatelessWidget {
  const DrinkMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: .55,
                physics: BouncingScrollPhysics(),
                children: List.generate(12, (index) {
                  return MenuCard(
                    tittle: 'Nasi Goreng Kampoeng',
                    harga: nf.format(21000),
                    image: "assets/images/milkshake-oreo.jpg",
                  );
                }),
              ),
            ),
            SizedBox(height: 65),
          ],
        ),
      ),
    );
  }
}
