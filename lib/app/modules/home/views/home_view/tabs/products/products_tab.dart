import 'package:casso/app/modules/edit_product/bindings/edit_product_binding.dart';
import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../data/model/product_model.dart';
import '../../../../../card/product_card/product_card.dart';
import '../../../../../components/floating_button/floating_button.dart';
import '../../../../../edit_product/views/edit_product_view.dart';

class ProductTab extends GetView<HomeController> {
  const ProductTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Obx(() => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: .89,
                      physics: BouncingScrollPhysics(),
                      children:
                          List.generate(controller.products.length, (index) {
                        ProductModel product = controller.products[index];
                        return ProductCard(
                          dataProduct: product,
                          addProduct: () {
                            controller.addProductOrder(product);
                          },
                          editProduct: () {
                            Get.to(
                              EditProductView(data: product),
                              binding: EditProductBinding(),
                            );
                          },
                        );
                      }),
                    ),
                  )),
              SizedBox(height: 85),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingButton(
            onTap: () {
              Get.to(EditProductView(), binding: EditProductBinding());
            },
          ),
        )
      ],
    );
  }
}
