import 'package:casso/app/data/constant.dart';
import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/modules/menu/views/components/menu_card.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllMenu extends StatelessWidget {
  const AllMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<MenuController>();
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
                children: List.generate(ctrl.makanan.length, (index) {
                  return Obx(
                    () => MenuCard(
                      tittle: ctrl.makanan[index]["namaMakanan"],
                      harga: nf.format(ctrl.makanan[index]["hargaMakanan"]),
                      image: "assets/images/milkshake-oreo.jpg",
                      // itemCount: ctrl.itemCount.value,
                      // onTap: () => ctrl.increment(),
                    ),
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
