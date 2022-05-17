import 'package:casso/app/data/models/users.dart';
import 'package:casso/app/modules/employe/controllers/pegawai_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constant.dart';

class DropDownStatus extends StatelessWidget {
  const DropDownStatus({
    Key? key,
    // required this.data,
  }) : super(key: key);
  // final UsersModel data;
  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(EmployeController());

    // String? status = data.status;
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            child: Text(
              "Status",
              style: TextStyle(
                color: Colors.black54,
                fontFamily: 'Ubuntu',
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Obx(() => Container(
                width: Get.width,
                child: DropdownButton<String>(
                  underline: Container(
                    height: 1,
                    color: Colors.black45,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  isDense: true,
                  hint: Text(
                    "SATATUS",
                    style: TextStyle(
                      color: darkColor,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  icon: Icon(
                    Icons.abc_outlined,
                    color: Colors.transparent,
                  ),
                  items: ctrl.data
                      .map(
                        (item) => DropdownMenuItem<String>(
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Ubuntu",
                              color: darkColor,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    ctrl.selected.value = val!;
                  },
                  value: 'ctrl.selected.value',
                ),
              ))
        ],
      ),
    );
  }
}
