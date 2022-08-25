import 'package:casso/app/data/model/product_model.dart';
import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/bottom_sheet_bar.dart';
import 'components/list_product_order.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .8,
      color: lightColor,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            height: 4,
            width: 60,
            color: textDark,
          ),
          BottomSheetBar(),
          const SizedBox(height: 64),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: GetBuilder<HomeController>(
                builder: (ctrl) {
                  final ids = Set();
                  final products = ctrl.productsOrder.value;
                  products.retainWhere((x) => ids.add(x.id));

                  return Column(
                    children: List.generate(
                      products.length,
                      (index) => ProductOrderItem(
                        tittle: ctrl.productsOrder[index].productName,
                        prices: (products[index].productPrice! *
                            products[index].productQty),
                        count: products[index].productQty,
                        removeOrder: () {
                          ctrl.removeProductOrder(products[index]);
                        },
                        addCount: () => ctrl.addProductOrder(products[index]),
                        minCount: () =>
                            ctrl.decrementProductOrder(products[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: () async {
              await controller.setTransaction();
              Get.back();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              height: 56,
              color: biru,
              child: Center(
                child: GetBuilder<HomeController>(
                  builder: (c) {
                    double _total = 0;
                    final x = c.productsOrder.value;
                    x.forEach((prd) {
                      _total += (prd.productQty * prd.productPrice!);
                    });
                    return Text(
                      "Charge RM $_total",
                      style: TextStyle(
                        color: lightColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
