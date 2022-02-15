import 'package:casso/app/data/constant.dart';
import 'package:casso/app/modules/product/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/card_description.dart';
import 'components/card_image.dart';
import 'components/card_text_field.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<ProductController>();
    return Scaffold(
      backgroundColor: primaryColor,

      /// APP BAR
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          'ADD PRODUCT',
          style: TextStyle(
            color: textColor,
            fontFamily: "Montserrat",
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ImageCard(),
            CardTextField(
              hintText: "Nama Produk",
              icon: Icons.keyboard_alt_outlined,
              textController: ctrl.namaProduct,
            ),
            CardTextField(
              hintText: "Harga Produk",
              icon: Icons.keyboard_alt_outlined,
              textController: ctrl.hargaProduct,
            ),
            Container(
                // margin: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
                // height: 50,
                // child: Hero(
                //   child: Material(
                //     color: primaryColor,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(16)),
                //     child: Container(
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(16),
                //         color: putih.withOpacity(.2),
                //       ),
                //     ),
                //   ),
                //   tag: _hero,
                // ),
                ),
            CradDeskripsi(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

const String _hero = "add-hero";




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
