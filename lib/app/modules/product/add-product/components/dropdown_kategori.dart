import 'package:casso/app/modules/product/controllers/product_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownCategory extends StatelessWidget {
  DropDownCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(ProductController());

    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      // height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: putih.withOpacity(.2),
      ),
      child: Row(
        children: [
          Icon(Icons.menu, color: lightColor.withOpacity(.7)),
          SizedBox(width: 8),
          Expanded(
            child: Obx(() => DropdownButtonFormField<String>(
                  decoration: InputDecoration(),
                  isDense: true,
                  dropdownColor: darkColor,
                  items: ctrl.data.value
                      .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "balsamiq",
                              fontWeight: FontWeight.w500,
                              color: lightColor.withOpacity(.7),
                            ),
                          )))
                      .toList(),
                  onChanged: (item) {
                    ctrl.selected.value = item!;

                    // print(selected);
                  },
                  value: ctrl.selected.value,
                )),
          ),
        ],
      ),
    );
  }
}
