import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/floating_button/floating_button.dart';
import '../controllers/printer_controller.dart';
import 'components/bluetooth_list.dart';

class PrinterView extends GetView<PrinterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: appBar(),
      // body: GetBuilder<PrinterController>(builder: (c) {
      //   if (c.device == null) {
      //     return noConnectedBluetooth();
      //   } else {
      //     return Container(
      //       child: Text(
      //         controller.device!.name!,
      //       ),
      //     );
      //   }

      //   // controller.device == null
      //   //     ? noConnectedBluetooth()
      //   //     : Container(
      //   //         child: Text(
      //   //           controller.device!.name!,
      //   //         ),
      //   //       );
      // }),
      floatingActionButton: FloatingButton(
        onTap: () {
          showDialog(
            barrierColor: Colors.black38,
            context: context,
            builder: (c) {
              Get.put(PrinterController());

              return Center(
                child: Container(
                  height: Get.height * .5,
                  width: Get.width * .8,
                  child: Bluetoothlist(),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Column noConnectedBluetooth() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: abu,
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.all(24),
          child: Icon(
            Icons.print_disabled_sharp,
            size: 56,
            color: darkColor,
          ),
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "klik",
              style: TextStyle(
                color: darkColor,
                fontFamily: 'Ubuntu',
                fontSize: 20,
              ),
            ),
            SizedBox(width: 4),
            Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48),
                  color: abu,
                ),
                child: Icon(Icons.add, size: 20)),
            SizedBox(width: 4),
            Text(
              "untuk menambahkan printer",
              style: TextStyle(
                color: darkColor,
                fontFamily: 'Ubuntu',
                fontSize: 18,
              ),
            )
          ],
        )
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, size: 20, color: lightColor),
        onPressed: Get.back,
      ),
      backgroundColor: darkColor,
      elevation: 0,
      title: Text(
        'Pengaturan Printer',
        style: TextStyle(
          color: lightColor,
          fontFamily: "Ubuntu",
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
    );
  }
}
