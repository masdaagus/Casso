import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constant.dart';

class ButtonCharge extends StatelessWidget {
  ButtonCharge({Key? key, this.onTap}) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Container(
            width: double.infinity,
            height: 64,
            decoration: BoxDecoration(
              color: hijau,
            ),
            child: Center(
              child: GetBuilder<HomeController>(
                builder: (c) {
                  double _total = 0;
                  final x = c.productsOrder.value;
                  x.forEach((prd) {
                    _total += (prd.productQty * prd.productPrice!);
                  });
                  return Text(
                    "Charge \$${_total}",
                    style: TextStyle(fontSize: 18, color: putih),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
