import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class ProductBestSeller extends StatelessWidget {
  const ProductBestSeller({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 98,
            width: 98,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/products/ikanbakar.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Ikan Bakar",
            style: TextStyle(
              color: darkColor,
              fontFamily: 'balsamiq',
              fontSize: 14,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 28,
                width: 28,
                decoration: BoxDecoration(
                  color: orange,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    "4",
                    style: TextStyle(
                      color: darkColor,
                      fontFamily: 'balsamiq',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                "Terjual",
                style: TextStyle(
                  color: darkColor,
                  fontFamily: 'balsamiq',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
