import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/modules/product/add-product/components/dropdown_kategori.dart';
import 'package:casso/app/modules/product/controllers/product_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/button_add.dart';
import 'components/card_description.dart';
import 'components/card_image.dart';
import 'components/card_text_field.dart';

class AddProductView extends StatelessWidget {
  AddProductView({
    Key? key,
    this.dataProduct,
    this.image,
  }) : super(key: key);

  final Product? dataProduct;
  final String? image;

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(ProductController());

    List<String> data = ['FOOD', 'DRINK', 'DESSERT'];
    String selected = 'FOOD';

    print(selected);

    return Scaffold(
      backgroundColor: darkColor,

      /// APP BAR
      appBar: AppBar(
        backgroundColor: darkColor,
        elevation: 0,
        title: Text(
          'ADD PRODUCT',
          style: TextStyle(
            color: abu,
            fontFamily: "balsamiq",
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20),
          onPressed: Get.back,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                ImageCard(image: image),
                CardTextField(
                  hintText: dataProduct!.productName ?? 'Nama Produk',
                  icon: Icons.keyboard_alt_outlined,
                  textController: ctrl.namaProduk,
                ),
                CardTextField(
                  hintText: "${nf.format(dataProduct!.productPrice)}",
                  icon: Icons.keyboard_alt_outlined,
                  textController: ctrl.hargaProduk,
                  isTextNumber: true,
                ),
                CardTextField(
                  hintText: "${dataProduct!.productStock ?? 'Stok Produk'}",
                  // hintText: 'Stock Produk',
                  icon: Icons.keyboard_alt_outlined,
                  textController: ctrl.stokProduk, isTextNumber: true,
                ),
                DropDownCategory(),
                CradDeskripsi(
                    textController: ctrl.deskripsiProduk,
                    description:
                        dataProduct!.productDescription ?? 'Deskripsi'),
                ButtonAdd(
                  onTap: () {
                    ctrl.addProduct();
                  },
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// const String _hero = "add-hero";




/// {@template custom_rect_tween}
/// Linear RectTween with a [Curves.easeOut] curve.
///
/// Less dramatic that the regular [RectTween] used in [Hero] animations.
/// {@endtemplate}
// class CustomRectTween extends RectTween {
//   /// {@macro custom_rect_tween}
//   CustomRectTween({
//      Rect? begin,
//      Rect? end,
//   }) : super(begin: begin, end: end);

//   @override
//   Rect lerp(double t) {
//     final elasticCurveValue = Curves.easeOut.transform(t);
//     return Rect.fromLTRB(
//       lerpDouble(begin.left, end.left, elasticCurveValue),
//       lerpDouble(begin.top, end.top, elasticCurveValue),
//       lerpDouble(begin.right, end.right, elasticCurveValue),
//       lerpDouble(begin.bottom, end.bottom, elasticCurveValue),
//     );
//   }
// }
