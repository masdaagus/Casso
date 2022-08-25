import 'dart:convert';
import 'dart:developer';

import 'package:casso/app/data/model/product_model.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.dataProduct,
    this.isOrderWidget = true,
    this.editProduct,
    this.addProduct,
  }) : super(key: key);

  final ProductModel dataProduct;
  final VoidCallback? editProduct;
  final VoidCallback? addProduct;
  final bool isOrderWidget;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: addProduct,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: abu,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (dataProduct.productImage == null)
                    ? Container(
                        width: size.width * .29,
                        height: size.width * .29,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: lightColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.no_photography_outlined,
                              size: 56,
                              color: darkColor,
                            ),
                            SizedBox(height: 4),
                            const Text(
                              "NO IMAGE",
                              style: TextStyle(
                                color: darkColor,
                                fontFamily: 'Ubuntu',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(
                        width: size.width * .29,
                        height: size.width * .29,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: lightColor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.memory(
                            base64Decode(dataProduct.productImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                Expanded(
                  child: GestureDetector(
                    onTap: editProduct,
                    child: Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: Icon(Icons.edit),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                "${dataProduct.productName}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: darkColor,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: Text(
                "RM ${dataProduct.productPrice}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: darkColor,
                  fontFamily: "Ubuntu",
                  letterSpacing: .5,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
