import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/product.dart';
import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/bottom_sheet.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.data,
    this.dataProduct,
    this.addProduct,
    this.isOrderWidget = true,
    this.minProduct,
    this.editProduct,
    // this.productImage,
  }) : super(key: key);

  final Product? dataProduct;
  final ProductOrder? data;
  final VoidCallback? addProduct;
  final VoidCallback? minProduct;
  final VoidCallback? editProduct;

  final bool isOrderWidget;
  // final String? productImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: abu,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    BottomSheetProduct(
                      dataProduct: dataProduct,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    isScrollControlled: true,
                    backgroundColor: lightColor,
                  );
                },
                child: (dataProduct!.productImage != null)
                    ? Container(
                        width: size.width * .29,
                        height: size.width * .29,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            dataProduct!.productImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        width: size.width * .29,
                        height: size.width * .29,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: lightColor),
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
                      ),
              ),
              SizedBox(width: 6),
              isOrderWidget
                  ? GetBuilder<MenuController>(
                      builder: (c) {
                        int qty = data!.productQty;
                        if (qty <= 0) {
                          return addButton();
                        } else {
                          return Container(
                            margin: const EdgeInsets.only(left: 4),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: addProduct,
                                  child: Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: biru,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: darkColor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  qty.toString(),
                                  style: TextStyle(
                                    color: darkColor,
                                    fontFamily: 'Ubuntu',
                                  ),
                                ),
                                SizedBox(height: 10),
                                GestureDetector(
                                  onTap: minProduct,
                                  child: Container(
                                    height: 28,
                                    width: 28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: biru,
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: darkColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    )
                  : Expanded(
                      child: GestureDetector(
                        onTap: editProduct,
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: lightColor,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: darkColor,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              dataProduct!.productName!,
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
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              nf.format(dataProduct!.productPrice),
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
    );
  }

  Widget addButton() {
    return Expanded(
      child: GestureDetector(
        onTap: addProduct,
        child: Center(
          child: Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: darkColor.withOpacity(.2)),
            child: Center(
              child: Icon(
                Icons.add,
                color: darkColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
