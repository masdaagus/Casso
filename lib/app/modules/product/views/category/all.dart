import 'package:casso/app/data/constant.dart';
import 'package:casso/app/modules/menu/views/components/menu_card.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkColor,
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
                children: List.generate(3, (index) {
                  return MenuCard(
                    tittle: "Nama Makanan",
                    harga: nf.format(12000),
                    image: "assets/images/milkshake-oreo.jpg",
                    // itemCount: ctrl.itemCount.value,
                    // onTap: () => ctrl.increment(),
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
