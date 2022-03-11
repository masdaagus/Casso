import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const lorem =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua";

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.addProduct,
    this.minProduct,
    this.detailProduct,
    this.productName,
    this.productPrice,
    this.textCount,
    this.productImage = "assets/images/Saly-22.png",
  }) : super(key: key);

  final VoidCallback? addProduct;
  final VoidCallback? minProduct;
  final VoidCallback? detailProduct;

  final String? productName;
  final double? productPrice;
  final String? productImage;

  final Widget? textCount;

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
                    Container(
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
                            Text(
                              "Milkshake Strowberry",
                              style: TextStyle(
                                color: lightColor,
                                fontFamily: "balsamiq",
                                fontSize: 18,
                                // fontWeight: FontWeight.,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(height: 24),
                            Container(
                              child: Text(
                                lorem,
                                maxLines: 7,
                                style: TextStyle(
                                  color: lightColor,
                                  fontFamily: "balsamiq",
                                  fontSize: 12,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
              if (textCount != null)
                controllProductCount()
              else
                Icon(Icons.star, color: lightColor, size: 32),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              productName ?? "Kosong",
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
              nf.format(productPrice),
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

  Container controllProductCount() {
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
          textCount ?? Container(),
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
