import 'package:casso/app/data/models/users.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:casso/app/utils/spinner_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/pegawai_controller.dart';
import 'components/custom_textfield.dart';

class EmployeDetailView extends StatelessWidget {
  EmployeDetailView({
    Key? key,
    required this.data,
    required this.image,
  }) : super(key: key);

  final UsersModel data;
  final String image;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<EmployeController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20, color: lightColor),
          onPressed: Get.back,
        ),
        backgroundColor: darkColor,
        elevation: 0,
      ),
      backgroundColor: lightColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  height: 150,
                  color: darkColor,
                  child: Center(
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: abu,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 24),
                        Expanded(
                          child: Text(
                            data.name ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 32,
                              color: lightColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          tittle: 'Nama',
                          conroller: ctrl.employeName =
                              TextEditingController(text: data.name),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Nama tidak boleh kosong';
                            }
                          },
                        ),
                        CustomTextField(
                          tittle: 'ID',
                          conroller: ctrl.employeId =
                              TextEditingController(text: data.email),
                          readOnly: true,
                        ),
                        CustomTextField(
                          tittle: 'Password',
                          conroller: ctrl.employePassword =
                              TextEditingController(text: data.password),
                          numType: true,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }
                          },
                        ),
                        // DropDownStatus(),
                        SizedBox(height: 40),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: darkColor),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ctrl.updateDataPegawai(data);
                            }
                          },
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                                color: lightColor, fontFamily: 'Ubuntu'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.all(24),
                //   child: TextField(
                //     controller: TextEditingController(text: 'Masda agus'),
                //     style: TextStyle(
                //       color: darkColor,
                //       fontWeight: FontWeight.w500,
                //       fontFamily: 'Ubuntu',
                //     ),
                //     decoration: InputDecoration(
                //         labelText: 'Nama',
                //         labelStyle: TextStyle(
                //           fontFamily: 'Ubuntu',
                //         )),
                //   ),
                // ),
              ],
            ),
          ),
          GetBuilder<EmployeController>(builder: (c) {
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
