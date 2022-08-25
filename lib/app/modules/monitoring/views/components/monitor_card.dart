import 'dart:ui';

import 'package:casso/app/data/models/order.dart';
import 'package:casso/app/modules/monitoring/controllers/monitoring_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'button_semua.dart';

class MonitorCard extends GetView<MonitoringController> {
  const MonitorCard({
    Key? key,
    // required this.data,
    this.orderButton = 'PROSES',
    this.isOrder = false,
    this.isWaiters = false,
    this.buttonAll,
    this.listOrder,
    this.delete,
    this.isTersaji = false,
  }) : super(key: key);

  // final Order data;
  final String orderButton;
  final bool isOrder;
  final bool isWaiters;
  final bool isTersaji;

  final Widget? listOrder;
  final VoidCallback? buttonAll;
  final VoidCallback? delete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16, bottom: 8, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            // color: Color(0XFFF3EFE0),
            color: Color(0XFFD1D1D1),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 24,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [putih, putih]),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(
                    //   "TABLE ${data.tableNumber} - (${data.guessName})",
                    //   style: TextStyle(
                    //     fontFamily: "Ubuntu",
                    //     color: darkColor,
                    //     fontSize: 12,
                    //     letterSpacing: .5,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // Text(
                    //   "By:${data.waitersName}",
                    //   style: TextStyle(
                    //     fontFamily: "Ubuntu",
                    //     color: darkColor,
                    //     fontSize: 12,
                    //     letterSpacing: .5,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    listOrder ?? Container(),
                  ],
                ),
              ),

              // Button Prosses semua
              isTersaji
                  ? Container(
                      margin:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: darkColor.withOpacity(.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TOTAL",
                            style: TextStyle(
                              color: putih,
                              fontFamily: "Ubuntu",
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              letterSpacing: .5,
                            ),
                          ),
                          // Text(
                          //   nf.format(data.totalPrices),
                          //   style: TextStyle(
                          //     color: putih,
                          //     fontFamily: "Ubuntu",
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 13,
                          //     letterSpacing: .5,
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  : ButtonAll(
                      tittleButton: "${orderButton.toUpperCase()} SEMUA",
                      onTap: buttonAll!,
                    ),
              SizedBox(height: 8)
            ],
          ),
        ),
        isWaiters
            ? Positioned(
                bottom: 22,
                left: 32,
                child: GestureDetector(
                  onTap: delete,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    // height: 32,
                    // width: 32,
                    child: Icon(
                      Icons.delete,
                      size: 18,
                      color: hitam,
                    ),
                    decoration: BoxDecoration(
                      color: lightColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              )
            : Container(),
        isTersaji
            ? Container()
            : Positioned(
                bottom: 22,
                right: 32,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  // child: Text(
                  //   "#${data.orderNumber}",
                  //   style: TextStyle(
                  //     color: darkColor,
                  //     fontFamily: 'Ubuntu',
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 16,
                  //   ),
                  // ),
                  decoration: BoxDecoration(
                    color: lightColor.withOpacity(.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              )
      ],
    );
  }
}

class DialogDeleteMonitoring extends StatelessWidget {
  DialogDeleteMonitoring({
    Key? key,
    required this.delete,
  }) : super(key: key);

  final VoidCallback delete;

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
            color: putih.withOpacity(.35),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Text(
                "HAPUS ORDER",
                style: TextStyle(
                  color: putih,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, left: 24, right: 24),
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: Get.width,
                decoration: BoxDecoration(),
                child: Text(
                  "Apa kamu yakin ingin menghapus order ini ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: .5,
                    color: lightColor,
                    fontFamily: 'Ubuntu',
                    fontSize: 16,
                  ),
                ),
              ),
              Divider(thickness: 1, color: putih.withOpacity(.6)),
              Center(
                child: ButtonDelete(onTap: delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonDelete extends StatelessWidget {
  const ButtonDelete({
    Key? key,
    this.isConfirmText = 'HAPUS',
    this.onTap,
  }) : super(key: key);

  final String isConfirmText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          isConfirmText,
          style: TextStyle(
            color: lightColor,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontSize: 12,
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          primary: merah.withOpacity(.5),
        ),
      ),
    );
  }
}
