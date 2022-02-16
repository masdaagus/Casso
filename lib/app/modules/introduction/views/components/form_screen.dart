import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'confirm_screen.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
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
              // height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: textColor.withOpacity(.2),
              ),
              child: Column(
                children: [
                  //
                  FormField(
                    iconData: Icons.store_mall_directory_outlined,
                    hintText: "Nama Resto",
                  ),
                  FormField(
                    iconData: Icons.location_on_outlined,
                    hintText: "Lokasi Resto",
                  ),
                  FormField(
                    iconData: Icons.chair,
                    hintText: "Jumlah Meja",
                    isNumber: true,
                  ),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => ConfirmScreen()),
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
                        primary: putih.withOpacity(.2),
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
      height: 48,
      decoration: BoxDecoration(
        color: putih.withOpacity(.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        keyboardType: isNumber ? TextInputType.number : TextInputType.name,
        style: TextStyle(
          color: putih,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: .5,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: textColor.withOpacity(.8),
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: .5,
          ),
          prefixIcon: Icon(
            iconData,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
