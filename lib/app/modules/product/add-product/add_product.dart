import 'package:casso/app/data/models/product.dart';
import 'package:casso/app/modules/home/bindings/home_binding.dart';
import 'package:casso/app/modules/home/views/home_view.dart';
import 'package:casso/app/modules/product/add-product/components/dropdown_kategori.dart';
import 'package:casso/app/modules/product/controllers/product_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:casso/app/utils/spinner_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/button_add.dart';
import 'components/card_description.dart';
import 'components/card_image.dart';
import 'components/card_text_field.dart';

class AddProductView extends StatelessWidget {
  AddProductView({
    Key? key,
    // this.dataProduct,
    // this.image,
  }) : super(key: key);

  // final Product? dataProduct;
  // final String? image;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(ProductController());

    String appBarTittle = 'ADD PRODUK';
    // if (dataProduct!.productName != null) {
    //   appBarTittle = 'EDIT PRODUK';
    // }
    return Scaffold(
      backgroundColor: lightColor,

      /// APP BAR
      appBar: AppBar(
        backgroundColor: darkColor,
        elevation: 0,
        title: Text(
          appBarTittle,
          style: TextStyle(
            color: lightColor,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: lightColor,
          ),
          onPressed: Get.back,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            // child: IconButton(
            //   onPressed: () => ctrl.deleteProduct(dataProduct!),
            //   icon: Icon(Icons.delete, color: lightColor),
            // ),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    /// IMAGE PRODUK
                    // ImageCard(
                    //   image: dataProduct!.productImage,
                    //   onTap: () {
                    //     ctrl.selectImage();
                    //   },
                    //   onCancel: () => ctrl.removeImage(),
                    // ),

                    // CardTextField(
                    //   isNumtype: false,
                    //   label: 'Nama Produk',
                    //   controller: ctrl.namaProduk =
                    //       TextEditingController(text: dataProduct!.productName),
                    //   hintText: 'Nama Produk',
                    //   validator: (value) {
                    //     if (value!.isEmpty)
                    //       return "Nama produk tidak boleh kosong";
                    //   },
                    // ),
                    // CardTextField(
                    //   label: 'Harga Produk',
                    //   controller: ctrl.hargaProduk = TextEditingController(
                    //     text: dataProduct!.productPrice!.toStringAsFixed(0),
                    //   ),
                    //   hintText: 'Harga Produk',
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return 'Harga produk tidak boleh kosong';
                    //     }
                    //   },
                    // ),
                    // CardTextField(
                    //   label: 'Stok Produk',
                    //   controller: ctrl.stokProduk = TextEditingController(
                    //     text: dataProduct!.productStock.toString(),
                    //   ),
                    //   hintText: 'Stok Produk',
                    //   validator: (value) {
                    //     if (value!.isEmpty)
                    //       return "Stok produk tidak boleh kosong";
                    //   },
                    // ),
                    // DropDownCategory(),
                    // CradDeskripsi(
                    //   textController: ctrl.deskripsiProduk =
                    //       TextEditingController(
                    //           text: dataProduct!.productDescription),
                    // ),
                    // ButtonAdd(
                    //   onTap: () {
                    //     if (formKey.currentState!.validate()) {
                    //       print('VALIDATED');

                    //       if (dataProduct!.productName == null) {
                    //         ctrl.addProduct().then(
                    //           (value) {
                    //             Get.back();
                    //             Get.back();
                    //           },
                    //         );
                    //       } else {
                    //         ctrl.editProduct(dataProduct!);
                    //       }
                    //     }
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ),
          // GetBuilder<ProductController>(builder: (c) {
          //   return c.isLoading
          //       ? Center(
          //           child: Container(
          //             height: Get.height,
          //             width: Get.width,
          //             color: hitam.withOpacity(.54),
          //             child: Center(
          //               child: Container(
          //                 height: 72,
          //                 width: 72,
          //                 decoration: BoxDecoration(
          //                   color: lightColor,
          //                   borderRadius: BorderRadius.circular(16),
          //                 ),
          //                 child: CustomSpinner(),
          //               ),
          //             ),
          //           ),
          //         )
          //       : Container();
          // })
        ],
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
