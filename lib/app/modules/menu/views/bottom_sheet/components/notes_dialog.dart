import 'dart:ui';
import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/menu/controllers/menu_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/dialog_cancel.dart';

class NotesDialog extends GetView<MenuController> {
  NotesDialog({
    Key? key,
    // required this.data,
  }) : super(key: key);

  // final ProductOrder data;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          width: Get.width,
          // height: 180,
          decoration: BoxDecoration(
            color: putih.withOpacity(.50),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              // Text(
              //   data.productName!,
              //   style: TextStyle(
              //     color: darkColor,
              //     fontFamily: "Ubuntu",
              //     fontWeight: FontWeight.bold,
              //     fontSize: 24,
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(
              //       top: 16, left: 24, right: 24, bottom: 24),
              //   padding: const EdgeInsets.symmetric(vertical: 10),
              //   width: Get.width,
              //   decoration: BoxDecoration(),
              //   child: TextField(
              //     onChanged: (val) {
              //       if (val.isNotEmpty && val != '') {
              //         data.productNote = val;
              //       }
              //     },
              //     controller: TextEditingController(text: data.productNote),
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontFamily: "Ubuntu",
              //       color: darkColor,
              //       fontSize: 16,
              //       letterSpacing: -.5,
              //     ),
              //     decoration: InputDecoration(
              //       errorStyle: TextStyle(
              //         color: merah,
              //         fontFamily: "Ubuntu",
              //         fontSize: 14,
              //         letterSpacing: 1,
              //       ),
              //       counterText: "",
              //       hintStyle: TextStyle(
              //         fontFamily: "Ubuntu",
              //         color: darkColor.withOpacity(.8),
              //         fontSize: 14,
              //         letterSpacing: 1,
              //       ),
              //       hintText: "Catatan order",
              //       contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              //     ),
              //   ),
              // ),
              // Divider(thickness: 1, color: darkColor.withOpacity(.6)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // DialogButton(
                  //   isConfirm: false,
                  //   isConfirmText: 'CANCEL',
                  //   onTap: () => Get.back(),
                  // ),
                  DialogButton(onTap: () async {
                    print('validated');
                    Get.back();
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
