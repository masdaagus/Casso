import 'dart:ui';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/printer_controller.dart';

class Bluetoothlist extends GetView<PrinterController> {
  Bluetoothlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 20,
          ),
          child: Container(
            padding: const EdgeInsets.only(top: 24, bottom: 16),
            width: Get.width,
            decoration: BoxDecoration(
              color: putih.withOpacity(.35),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  "LIST BLUETOOTH",
                  style: TextStyle(
                    color: darkColor,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 24),
                Expanded(
                  child: GetBuilder<PrinterController>(builder: (c) {
                    // if (c.devices.length != 0) {
                    //   return ListView.builder(
                    //     physics: NeverScrollableScrollPhysics(),
                    //     shrinkWrap: true,
                    //     itemCount: c.devices.length,
                    //     itemBuilder: (context, index) {
                    //       var blu = c.devices[index];
                    //       return BluetoothItem(
                    //         tittle: blu.name,
                    //         onTap: () async {
                    //           // await c.pickPrinter(blu);
                    //           Get.back();
                    //         },
                    //       );
                    //     },
                    //   );
                    // }
                    return Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: abu,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.print_disabled_rounded,
                                size: 64,
                                color: darkColor,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Tidak ada printer\nyang terhubung',
                              style: TextStyle(
                                color: darkColor,
                                fontFamily: 'Ubuntu',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
