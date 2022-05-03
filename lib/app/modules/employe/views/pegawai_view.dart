import 'package:casso/app/data/models/users.dart';
import 'package:casso/app/modules/components/floating_button/floating_button.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pegawai_controller.dart';
import 'components/card_employe.dart';
import 'components/search_bar.dart';
import 'employe_edit_view.dart';

class EmployeView extends GetView<EmployeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(
        onTap: () {},
      ),
      backgroundColor: lightColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20, color: lightColor),
          onPressed: Get.back,
        ),
        backgroundColor: darkColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Text(
            'PEGAWAI',
            style: TextStyle(
              color: lightColor,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              color: darkColor,
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.only(bottom: 24, top: 24),
              child: SearchBar(),
            ),
            SizedBox(height: 16),
            ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.employes.length,
                itemBuilder: (context, index) {
                  UsersModel data = controller.employes[index];
                  return CardEmploye(
                    data: data,
                    image: controller.images[index],
                    onTap: () => Get.to(
                      EmployeDetailView(data: data),
                      duration: Duration(milliseconds: 300),
                      transition: Transition.fadeIn,
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
