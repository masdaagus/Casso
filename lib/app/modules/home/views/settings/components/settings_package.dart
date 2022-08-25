import 'package:casso/app/modules/home/views/settings/components/settings_item.dart';
import 'package:casso/app/modules/null.dart';
import 'package:casso/app/modules/printer/views/printer_view.dart';
import 'package:flutter/material.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:get/get.dart';

import '../../../../printer/bindings/printer_binding.dart';

class PackageSettings extends StatelessWidget {
  const PackageSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(16),
        //   child: Text(
        //     "Pengaturan",
        //     style: TextStyle(
        //       color: darkColor,
        //       fontFamily: 'Ubuntu',
        //       fontWeight: FontWeight.w700,
        //       fontSize: 18,
        //     ),
        //   ),
        // ),
        Container(
          // margin: const EdgeInsets.only(top: 300),
          width: double.infinity,
          color: putih,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SettingItem(
                icon: Icons.newspaper,
                tittle: 'Pengaturan Invoice',
                onTap: () {
                  Get.to(
                    () => NullWidget(),
                    duration: Duration(milliseconds: 300),
                    transition: Transition.fadeIn,
                  );
                },
              ),
              // SettingItem(
              //   icon: Icons.print_outlined,
              //   tittle: 'Pengaturan Printer Bloetooth',
              //   onTap: () {
              //     Get.to(
              //       () => PrinterView(),
              //       binding: PrinterBinding(),
              //       duration: Duration(milliseconds: 300),
              //       transition: Transition.fadeIn,
              //     );
              //   },
              // ),
              SettingItem(
                icon: Icons.settings_outlined,
                tittle: 'Pengaturan Fitur',
                onTap: () {
                  Get.to(
                    () => NullWidget(),
                    duration: Duration(milliseconds: 300),
                    transition: Transition.fadeIn,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
