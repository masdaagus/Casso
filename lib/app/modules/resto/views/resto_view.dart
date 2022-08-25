import 'package:casso/app/modules/home/views/home_view.dart';
import 'package:casso/app/modules/resto/views/components/custom_textfield.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:casso/app/utils/spinner_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/resto_controller.dart';
import 'components/resto_info.dart';

class RestoView extends GetView<RestoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: darkColor,
        elevation: 0,
        title: Text('Pengaturan Resto'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // RestoInfo(
                    //   ownerName: controller.resto.value.ownerName,
                    //   restoLocation: controller.resto.value.restoLocation,
                    //   restoName: controller.resto.value.restoName,
                    // ),
                    SizedBox(height: 48),
                    TextFieldHome(
                      label: 'Nama Resto',
                      isTextTypeNumber: false,
                      controller: controller.restoName =
                          TextEditingController(),
                    ),
                    TextFieldHome(
                      label: 'Nama Owner',
                      isTextTypeNumber: false,
                      controller: controller.ownerName =
                          TextEditingController(),
                    ),
                    TextFieldHome(
                      label: 'Alamat Resto',
                      isTextTypeNumber: false,
                      controller: controller.restoLocation =
                          TextEditingController(),
                    ),
                    TextFieldHome(
                      label: 'Jumlah Table',
                      controller: controller.restoTable =
                          TextEditingController(),
                    ),
                    TextFieldHome(
                      label: 'Pajak %',
                      controller: controller.restoTaxes = TextEditingController(
                          // text: controller.resto.value.restoTaxes!
                          //     .toStringAsFixed(0),
                          ),
                    ),
                    SizedBox(height: 56),
                    ElevatedButton(
                      onPressed: () async {
                        await controller.updateResto();
                        Get.back();
                      },
                      child: Text('SUBMIT'),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          color: lightColor,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w600,
                        ),
                        primary: darkColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GetBuilder<RestoController>(builder: (c) {
            return c.isLoading
                ? Center(
                    child: Container(
                      height: Get.height,
                      width: Get.width,
                      color: hitam.withOpacity(.54),
                      child: Center(
                        child: Container(
                          height: 72,
                          width: 72,
                          decoration: BoxDecoration(
                            color: lightColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: CustomSpinner(),
                        ),
                      ),
                    ),
                  )
                : Container();
          })
        ],
      ),
    );
  }
}
