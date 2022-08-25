import 'package:casso/app/data/model/product_model.dart';
import 'package:casso/app/data/models/product.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'no_image.dart';

class BottomSheetProduct extends StatelessWidget {
  const BottomSheetProduct({
    Key? key,
    // this.productImage,
    // required this.data,
    required this.dataProduct,
  }) : super(key: key);

  // final String? productImage;
  // final ProductOrder? data;
  final ProductModel? dataProduct;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: size.height * .65,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: Get.height * .4,
                width: Get.height * .4,
                decoration: BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: dataProduct!.productImage != null
                      ? Image.network(
                          dataProduct!.productImage!,
                          fit: BoxFit.cover,
                        )
                      : NoImageWidget(),
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                dataProduct!.productName!,
                style: TextStyle(
                  color: darkColor,
                  fontFamily: "Ubuntu",
                  fontSize: 24,
                  // fontWeight: FontWeight.,
                  letterSpacing: 1,
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nf.format(dataProduct!.productPrice),
                    style: TextStyle(
                      color: darkColor.withOpacity(.7),
                      fontFamily: "Ubuntu",
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  // Text(
                  // nf.format(data!.productPrice ?? dataProduct!.productStock),
                  //   "Stock = ${dataProduct!.productStock}",
                  //   maxLines: 7,
                  //   style: TextStyle(
                  //     color: darkColor.withOpacity(.7),
                  //     fontFamily: "Ubuntu",
                  //     fontSize: 16,
                  //     letterSpacing: 1,
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(height: 24),
            // Container(
            //   padding: const EdgeInsets.all(8),
            //   width: size.width,
            //   height: 100,
            //   decoration: BoxDecoration(
            //     border: Border.all(color: darkColor.withOpacity(.2)),
            //     borderRadius: BorderRadius.circular(16),
            //   ),
            //   child: Text(
            //     dataProduct!.productDescription ?? 'Description...',
            //     maxLines: 7,
            //     style: TextStyle(
            //       color: darkColor.withOpacity(.5),
            //       fontFamily: "Ubuntu",
            //       fontSize: 12,
            //       letterSpacing: 1,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
