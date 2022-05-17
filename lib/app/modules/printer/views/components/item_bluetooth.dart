import 'package:casso/app/modules/printer/controllers/printer_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BluetoothItem extends StatelessWidget {
  const BluetoothItem({
    Key? key,
    this.tittle,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String? tittle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        height: 40,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                putih.withOpacity(.25),
                biru.withOpacity(.20),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24)),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: abu,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.bluetooth,
                color: darkColor,
                size: 20,
              ),
            ),
            SizedBox(width: 12),
            Text(
              tittle!,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: darkColor,
                fontFamily: 'Ubuntu',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
