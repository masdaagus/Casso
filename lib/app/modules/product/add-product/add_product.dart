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

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(ProductController());

    String appBarTittle = 'ADD PRODUK';
    if (dataProduct!.productName != null) {
      appBarTittle = 'EDIT PRODUK';
    }
    return Scaffold(
      backgroundColor: lightColor,

      /// APP BAR
      appBar: AppBar(
        backgroundColor: lightColor,
        elevation: 0,
        title: Text(
          appBarTittle,
          style: TextStyle(
            color: darkColor,
            fontFamily: "balsamiq",
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: darkColor,
          ),
          onPressed: Get.back,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: () => ctrl.deleteProduct(dataProduct!),
              icon: Icon(Icons.delete, color: darkColor),
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  /// IMAGE PRODUK
                  ImageCard(image: image),

                  /// TEXT FIELD NAMA PRODUK
                  CardTextField(
                    icon: Icons.keyboard_alt_outlined,
                    textFormField: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Nama produk tidak boleh kosong";
                      },
                      maxLength: 30,
                      controller: ctrl.namaProduk =
                          TextEditingController(text: dataProduct!.productName),
                      decoration: InputDecoration(
                        labelText: 'Nama Produk',
                        isDense: true,
                        errorStyle: TextStyle(
                          color: merah,
                          fontFamily: "balsamiq",
                          fontSize: 14,
                          letterSpacing: 1,
                        ),
                        counterText: "",
                        hintText: dataProduct!.productName ?? 'Nama Produk',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: "balsamiq",
                          fontWeight: FontWeight.w500,
                          color: darkColor.withOpacity(.6),
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "balsamiq",
                        fontWeight: FontWeight.w500,
                        color: darkColor,
                      ),
                    ),
                  ),

                  /// TEXT FIELD [HARGA] PRODUK
                  CardTextField(
                    icon: Icons.keyboard_alt_outlined,
                    textFormField: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Harga produk tidak boleh kosong";
                      },
                      controller: ctrl.hargaProduk = TextEditingController(
                        text: dataProduct!.productPrice.toString(),
                      ),
                      maxLength: 30,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: TextStyle(
                          color: merah,
                          fontFamily: "balsamiq",
                          fontSize: 14,
                          letterSpacing: 1,
                        ),
                        counterText: "",
                        hintText: 'Harga Produk',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: "balsamiq",
                          fontWeight: FontWeight.w500,
                          color: darkColor.withOpacity(.6),
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "balsamiq",
                        fontWeight: FontWeight.w500,
                        color: darkColor,
                      ),
                    ),
                  ),

                  /// TEXT FIELD [STOK] PRODUK
                  CardTextField(
                    icon: Icons.keyboard_alt_outlined,
                    textFormField: TextFormField(
                      controller: ctrl.stokProduk,
                      maxLength: 30,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        isDense: true,
                        errorStyle: TextStyle(
                          color: merah,
                          fontFamily: "balsamiq",
                          fontSize: 14,
                          letterSpacing: 1,
                        ),
                        counterText: "",
                        hintText: 'Stok Produk',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontFamily: "balsamiq",
                          fontWeight: FontWeight.w500,
                          color: darkColor.withOpacity(.6),
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "balsamiq",
                        fontWeight: FontWeight.w500,
                        color: darkColor,
                      ),
                    ),
                  ),
                  DropDownCategory(),
                  CradDeskripsi(
                    textController: ctrl.deskripsiProduk,
                    description: dataProduct!.productDescription ?? 'Deskripsi',
                  ),
                  ButtonAdd(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        if (dataProduct!.productName == null) {
                          ctrl.addProduct();
                        } else {
                          ctrl.editProduct(dataProduct!);
                        }
                      }
                    },
                  ),
                  SizedBox(height: 24),
                ],
              ),
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
