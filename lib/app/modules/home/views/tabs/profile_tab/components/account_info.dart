import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo(
      {Key? key, this.tittle, this.value, this.icon, this.isCanHide = false})
      : super(key: key);

  final String? tittle;
  final String? value;
  final IconData? icon;
  final bool isCanHide;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: darkColor.withOpacity(.7)),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tittle!,
                style: TextStyle(
                    color: darkColor.withOpacity(.7),
                    fontFamily: "Ubuntu",
                    fontSize: 14),
              ),
              Container(
                width: Get.width - 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      value!,
                      style: TextStyle(
                          color: darkColor, fontFamily: "Ubuntu", fontSize: 18),
                    ),
                    isCanHide
                        ? Icon(Icons.remove_red_eye_outlined, color: darkColor)
                        : Container(),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                height: .5,
                width: Get.width - 84,
                color: darkColor.withOpacity(.5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
