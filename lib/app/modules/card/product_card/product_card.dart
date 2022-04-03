import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/data/models/resto.dart';
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
    this.productImage = "assets/images/Saly-22.png",
  }) : super(key: key);

  final Product? dataProduct;
  final ProductOrder? data;
  final VoidCallback? addProduct;
  final VoidCallback? minProduct;
  final VoidCallback? editProduct;

  final bool isOrderWidget;
  final String? productImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: lightColor.withOpacity(.10),
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
                      productImage: productImage,
                      data: data,
                      dataProduct: dataProduct,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    isScrollControlled: true,
                    backgroundColor: darkColor,
                  );
                },
                child: Container(
                  width: size.width * .29,
                  height: size.width * .29,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 5,
                      color: darkColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      productImage!,
                      fit: BoxFit.cover,
                    ),
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
                                      color: lightColor.withOpacity(.20),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: lightColor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  qty.toString(),
                                  style: TextStyle(
                                    color: abu,
                                    fontFamily: 'balsamiq',
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
                                      color: lightColor.withOpacity(.20),
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: lightColor,
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
                              color: lightColor.withOpacity(.2),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: lightColor,
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
              data!.productName ?? dataProduct!.productName!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: lightColor,
                fontFamily: "balsamiq",
                letterSpacing: .5,
                fontSize: 13,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              nf.format(data!.productPrice ?? dataProduct!.productPrice),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: iconColor,
                fontFamily: "balsamiq", letterSpacing: .5,
                // fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget addButton() {
    return GestureDetector(
      onTap: addProduct,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        height: 24,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: lightColor.withOpacity(.2)),
        child: Center(
          child: Text(
            "Add",
            style: TextStyle(
              color: lightColor,
              fontFamily: "balsamiq",
              letterSpacing: .5,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }
}
