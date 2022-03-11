import 'package:casso/app/data/models/users.dart';
import 'package:casso/app/modules/components/floating_button/floating_button.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pegawai_controller.dart';
import 'components/pegawai_card.dart';

class PegawaiView extends GetView<PegawaiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingButton(
        onTap: () {},
      ),
      backgroundColor: darkColor,
      appBar: AppBar(
        title: Text(
          'PEGAWAI',
          style: TextStyle(
            fontFamily: "balsamiq",
            letterSpacing: .5,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20, color: textColor),
          onPressed: Get.back,
        ),
        backgroundColor: darkColor,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 32),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  physics: BouncingScrollPhysics(),
                  children: List.generate(4, (index) {
                    UsersModel employe = controller.resto.restoEmploye![index];
                    return PegawaiCard(
                      image: controller.images[index],
                      email: employe.email,
                      status: employe.status,
                    );
                  }),
                ),
              ),
              SizedBox(height: 65),
            ],
          ),
        ),
      ),
    );
  }
}
