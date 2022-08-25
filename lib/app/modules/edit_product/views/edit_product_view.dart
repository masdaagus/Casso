import 'dart:convert';
import 'dart:developer';

import 'package:casso/app/data/model/product_model.dart';
import 'package:casso/app/modules/edit_product/views/components/button_add_product.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_product_controller.dart';
import 'components/card_image.dart';
import 'components/custom_text_field.dart';

class EditProductView extends GetView<EditProductController> {
  final _formKey = GlobalKey<FormState>();
  EditProductView({this.data});

  final ProductModel? data;
  @override
  Widget build(BuildContext context) {
    // final ctrl = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data != null ? 'Edit Product' : 'Add Product',
          style: TextStyle(color: lightColor, fontFamily: 'Ubuntu'),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: darkColor,
        actions: [
          GestureDetector(
            onTap: () async {
              await controller.deleteProduct(data!);
              Get.back();
            },
            child: Icon(Icons.delete),
          ),
          const SizedBox(width: 16)
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// IMAGE PRODUK
                ImageCard(
                  image: data?.productImage,
                  onTap: () {
                    controller.selectImage();
                  },
                  onCancel: () {
                    controller.removeImage();
                  },
                ),

                CustomTextField(
                  isNumtype: false,
                  label: 'Nama Produk',
                  controller: controller.namaProduk =
                      TextEditingController(text: data?.productName),
                  hintText: 'Nama Produk',
                  validator: (value) {
                    if (value!.isEmpty) return "Nama produk tidak boleh kosong";
                  },
                ),
                CustomTextField(
                  label: 'Harga Produk',
                  controller: controller.hargaProduk = TextEditingController(
                      text: "${data?.productPrice ?? ''}"),
                  hintText: 'Harga Produk',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Harga produk tidak boleh kosong';
                    }
                  },
                ),
                CustomTextField(
                  isNumtype: false,
                  label: 'Category',
                  controller: controller.categoryProduk =
                      TextEditingController(text: data?.productCategory),
                  hintText: 'Category Produk',
                  validator: (value) {
                    if (value!.isEmpty)
                      return "Category produk tidak boleh kosong";
                  },
                ),

                ButtonAddProduct(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      if (data == null) {
                        await controller.insertProduct();
                      } else {
                        ProductModel _dataModel = ProductModel(
                          id: data?.id,
                          productName: controller.namaProduk.text.trim(),
                          productPrice: double.tryParse(
                            "${controller.hargaProduk.text}",
                          ),
                          productCategory: controller.categoryProduk.text,
                          productImage:
                              controller.stringImage ?? data?.productImage,
                        );
                        await controller.updateProduct(_dataModel);
                      }

                      Get.back();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
