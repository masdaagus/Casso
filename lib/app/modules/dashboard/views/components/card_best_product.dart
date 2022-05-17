import 'package:flutter/material.dart';
import 'package:casso/app/utils/constant.dart';

class CardBestProduct extends StatelessWidget {
  const CardBestProduct({
    Key? key,
    this.productName = 'Belum ada produk',
    this.productPrice = 0,
    this.productQty = 0,
  }) : super(key: key);

  final String productName;
  final double productPrice;
  final int productQty;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double? _total = (productQty) * (productPrice);
    return Container(
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: lightColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: darkColor.withOpacity(.10),
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: putih,
            ),
            child: Center(
                child: Icon(
              Icons.no_photography_outlined,
              color: darkColor,
              size: 48,
            )),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width * .3,
                  child: Text(
                    productName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: darkColor,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  nf.format(productPrice),
                  style: TextStyle(
                    color: textDark,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Terjual = ${productQty}",
                  style: TextStyle(
                    fontSize: 12,
                    color: textDark,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "${nf.format(_total)}",
                  style: TextStyle(
                    fontSize: 12,
                    color: textDark,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 24)
        ],
      ),
    );
  }
}
