// import 'package:casso/app/data/models/order.dart';
// import 'package:casso/app/data/models/product.dart';
// import 'package:casso/app/modules/card/product_card/product_card.dart';
// import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
// import 'package:casso/app/utils/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DessertMenu extends StatelessWidget {
//   const DessertMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: lightColor,
//       child: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             GetBuilder<MenuController>(builder: (c) {
//               List<ProductOrder> dessert = c.productsOrder
//                   .where((d) => d.productCategory == 'DESSERT')
//                   .toList();
//               List<Product> dessertProduct = c.filteredProducts
//                   .where((d) => d.productCategory == 'DESSERT')
//                   .toList();
//               return Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: GridView.count(
//                   shrinkWrap: true,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                   crossAxisCount: 2,
//                   childAspectRatio: .89,
//                   physics: BouncingScrollPhysics(),
//                   children: List.generate(dessertProduct.length, (index) {
//                     ProductOrder data = dessert[index];
//                     Product product = dessertProduct[index];

//                     return ProductCard(
//                       data: data,
//                       dataProduct: product,
//                       addProduct: () async {
//                         c.addProduct(data);
//                       },
//                       minProduct: () async {
//                         c.minProduct(data);
//                       },
//                     );
//                   }),
//                 ),
//               );
//             }),

//             // Container(
//             //   padding: const EdgeInsets.symmetric(horizontal: 16),
//             //   child: GridView.count(
//             //     shrinkWrap: true,
//             //     crossAxisSpacing: 10,
//             //     mainAxisSpacing: 10,
//             //     crossAxisCount: 2,
//             //     childAspectRatio: .89,
//             //     physics: BouncingScrollPhysics(),
//             //     children: List.generate(dessert.length, (index) {
//             //       ProductOrder data = dessert[index];
//             //       Product product = dessertProduct[index];

//             //       return ProductCard(
//             //         data: data,
//             //         dataProduct: product,
//             //         addProduct: () async {
//             //           controller.addProduct(data);
//             //         },
//             //         minProduct: () async {
//             //           controller.minProduct(data);
//             //         },
//             //       );
//             //     }),
//             //   ),
//             // ),
//             SizedBox(height: 65),
//           ],
//         ),
//       ),
//     );
//   }
// }
