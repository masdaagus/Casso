import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/resto.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetProduct extends StatelessWidget {
  const BottomSheetProduct({
    Key? key,
    required this.productImage,
    required this.data,
    required this.dataProduct,
  }) : super(key: key);

  final String? productImage;
  final ProductOrder? data;
  final Product? dataProduct;

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
                  child: Image.asset(
                    productImage!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                data!.productName ?? dataProduct!.productName!,
                style: TextStyle(
                  color: lightColor,
                  fontFamily: "balsamiq",
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
                    nf.format(data!.productPrice ?? dataProduct!.productPrice),
                    style: TextStyle(
                      color: abu,
                      fontFamily: "balsamiq",
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    // nf.format(data!.productPrice ?? dataProduct!.productStock),
                    "Stock = ${data!.productStock ?? dataProduct!.productStock}",
                    maxLines: 7,
                    style: TextStyle(
                      color: abu,
                      fontFamily: "balsamiq",
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(8),
              width: size.width,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: lightColor.withOpacity(.2)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                data!.productDescription ?? dataProduct!.productDescription!,
                maxLines: 7,
                style: TextStyle(
                  color: lightColor.withOpacity(.5),
                  fontFamily: "balsamiq",
                  fontSize: 12,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
