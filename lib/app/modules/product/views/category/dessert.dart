// import 'package:casso/app/data/models/order.dart';
// import 'package:casso/app/data/models/product.dart';
// import 'package:casso/app/modules/card/product_card/product_card.dart';
// import 'package:casso/app/modules/components/search_bar/search_bar.dart';
// import 'package:casso/app/modules/product/add-product/add_product.dart';

// import 'package:casso/app/modules/product/controllers/product_controller.dart';
// import 'package:casso/app/utils/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DessertProduct extends GetView<ProductController> {
//   const DessertProduct({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Get.put(ProductController());
//     return Container(
//       color: lightColor,
//       child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: GetBuilder<ProductController>(builder: (c) {
//             List<Product> dessrtProduct = c.foundAllProducts.value
//                 .where((d) => d.productCategory == 'DESSERT')
//                 .toList();
//             return Column(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 16),
//                   child: GridView.count(
//                     shrinkWrap: true,
//                     crossAxisSpacing: 16,
//                     mainAxisSpacing: 16,
//                     crossAxisCount: 2,
//                     childAspectRatio: .89,
//                     physics: BouncingScrollPhysics(),
//                     children: List.generate(dessrtProduct.length, (index) {
//                       Product data = dessrtProduct[index];
//                       ProductOrder kosong = ProductOrder();

//                       return ProductCard(
//                         dataProduct: data,
//                         data: kosong,
//                         isOrderWidget: false,
//                         editProduct: () {
//                           Get.to(() => AddProductView(
//                                 dataProduct: data,
//                                 // image: image,
//                               ));
//                         },
//                       );
//                     }),
//                   ),
//                 ),
//                 SizedBox(height: 65),
//               ],
//             );
//           })),
//     );
//   }
// }
