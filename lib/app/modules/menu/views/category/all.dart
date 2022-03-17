import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/card/product_card/product_card.dart';
import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllMenu extends GetView<MenuController> {
  const AllMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkColor,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                tittleProduct("FOOD"),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: .89,
                    physics: BouncingScrollPhysics(),
                    children: List.generate(controller.food.length, (index) {
                      ProductOrder data = controller.food[index];

                      return ProductCard(
                        productName: data.productName,
                        productPrice: data.productPrice,
                        addProduct: () async {
                          data.productQty++;
                          await controller.addProduct(data);
                          controller.update();
                        },
                        minProduct: () async {
                          data.productQty--;
                          await controller.minProduct(data);
                          controller.update();
                        },
                        detailProduct: () {},
                        textCount: GetBuilder<MenuController>(
                          builder: (c) {
                            int qty = c.food[index].productQty;
                            if (qty < 0) qty = 0;
                            return Text(
                              qty.toString(),
                              style: TextStyle(
                                color: textColor,
                                fontFamily: 'balsamiq',
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(thickness: .5, color: lightColor.withOpacity(.2)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                tittleProduct("DRINK"),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: .89,
                    physics: BouncingScrollPhysics(),
                    children: List.generate(controller.drink.length, (index) {
                      ProductOrder data = controller.drink[index];

                      return ProductCard(
                        productName: data.productName,
                        productPrice: data.productPrice,
                        addProduct: () async {
                          data.productQty++;
                          await controller.addProduct(data);
                          controller.update();
                        },
                        minProduct: () async {
                          data.productQty--;
                          await controller.minProduct(data);
                          controller.update();
                        },
                        detailProduct: () {},
                        textCount: GetBuilder<MenuController>(
                          builder: (c) {
                            int qty = c.drink[index].productQty;
                            if (qty < 0) qty = 0;
                            return Text(
                              qty.toString(),
                              style: TextStyle(
                                color: textColor,
                                fontFamily: 'balsamiq',
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(thickness: .5, color: lightColor.withOpacity(.2)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                tittleProduct("DESSERT"),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: .89,
                    physics: BouncingScrollPhysics(),
                    children: List.generate(controller.dessert.length, (index) {
                      ProductOrder data = controller.dessert[index];

                      return ProductCard(
                        productName: data.productName,
                        productPrice: data.productPrice,
                        addProduct: () async {
                          data.productQty++;
                          await controller.addProduct(data);
                          controller.update();
                        },
                        minProduct: () async {
                          data.productQty--;
                          await controller.minProduct(data);
                          controller.update();
                        },
                        detailProduct: () {},
                        textCount: GetBuilder<MenuController>(
                          builder: (c) {
                            int qty = c.dessert[index].productQty;
                            if (qty < 0) qty = 0;
                            return Text(
                              qty.toString(),
                              style: TextStyle(
                                color: textColor,
                                fontFamily: 'balsamiq',
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(thickness: .5, color: lightColor.withOpacity(.2)),
            SizedBox(height: 85),
          ],
        ),
      ),
    );
  }

  Container tittleProduct(String tittle) {
    return Container(
      margin: const EdgeInsets.only(left: 16, bottom: 16),
      height: 24,
      width: Get.width * .3,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0XFFA0B5EB),
          Color(0XFFC9F0E4),
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          tittle,
          style: TextStyle(
            color: darkColor,
            fontFamily: "balsamiq",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
