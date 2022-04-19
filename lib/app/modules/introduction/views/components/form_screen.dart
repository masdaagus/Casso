import 'package:casso/app/modules/introduction/controllers/introduction_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FormScreen extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 20),
            Center(
              child: Container(
                width: Get.width * .8,
                margin: const EdgeInsets.only(top: 160),
                child: Lottie.asset("assets/lottie/moca-cafe.json"),
              ),
            ),
            SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: abu,
              ),
              child: Column(
                children: [
                  //
                  FormField(
                    iconData: Icons.store_mall_directory_outlined,
                    hintText: "Nama Resto",
                    controller: controller.restoName,
                  ),
                  FormField(
                    iconData: Icons.location_on_outlined,
                    hintText: "Lokasi Resto",
                    controller: controller.restoLocation,
                  ),
                  FormField(
                    iconData: Icons.chair,
                    hintText: "Jumlah Meja",
                    controller: controller.restoTable,
                    isNumber: true,
                  ),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      // onPressed: () => Get.to(() => HomeView()),
                      onPressed: () => controller.setResto(),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: hitam.withOpacity(.8),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        primary: biru.withOpacity(.8),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}

class FormField extends StatelessWidget {
  const FormField({
    Key? key,
    this.controller,
    this.hintText,
    this.iconData,
    this.isNumber = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final IconData? iconData;
  final bool isNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(top: 3),
      height: 48,
      decoration: BoxDecoration(
        color: putih,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.name,
        style: TextStyle(
          color: darkColor,
          fontFamily: "Ubuntu",
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: .5,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: darkColor.withOpacity(.7),
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: .5,
          ),
          prefixIcon: Icon(
            iconData,
            color: darkColor.withOpacity(.7),
          ),
        ),
      ),
    );
  }
}
