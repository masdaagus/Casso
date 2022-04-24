import 'package:casso/app/modules/home/views/settings/components/settings_item.dart';
import 'package:casso/app/modules/null.dart';
import 'package:flutter/material.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:get/get.dart';

class PackageHelpAndInformation extends StatelessWidget {
  const PackageHelpAndInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            "Pusat Bantuan & Informasi",
            style: TextStyle(
              color: darkColor,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          // margin: const EdgeInsets.only(top: 300),
          width: double.infinity,
          color: putih,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SettingItem(
                icon: Icons.help_outline_outlined,
                tittle: 'Pusat Bantuan',
                onTap: () {
                  Get.to(
                    () => NullWidget(),
                    duration: Duration(milliseconds: 300),
                    transition: Transition.fadeIn,
                  );
                },
              ),
              SettingItem(
                icon: Icons.share_rounded,
                tittle: 'Bagikan Casso',
                onTap: () {
                  Get.to(
                    () => NullWidget(),
                    duration: Duration(milliseconds: 300),
                    transition: Transition.fadeIn,
                  );
                },
              ),
              SettingItem(
                icon: Icons.settings_outlined,
                tittle: 'Syarat dan Ketentuan',
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
