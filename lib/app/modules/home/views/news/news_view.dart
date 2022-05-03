import 'package:casso/app/data/models/users.dart';
import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/card_employe.dart';

class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HomeController>();

    bool isShow = c.user.value.status == 'OWNER';

    return SafeArea(
        child: Column(
      children: [
        Container(
          height: 80,
          color: darkColor,
          width: double.infinity,
          child: Center(
            child: Text(
              "Berita dan Data",
              style: TextStyle(
                color: lightColor,
                fontFamily: 'Ubuntu',
                letterSpacing: .5,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                isShow
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              'DATA KARYAWAN',
                              style: TextStyle(
                                color: darkColor,
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 24),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: c.employes.length,
                            itemBuilder: (context, index) {
                              UsersModel data = c.employes[index];
                              return CardEmployeNews(
                                data: data,
                                image: c.images[index],
                              );
                            },
                          ),
                        ],
                      )
                    : Container(),
                Container(
                  height: 300,
                  width: double.infinity,
                  color: putih,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.message,
                        size: 48,
                        color: darkColor,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Tidak ada berita hari ini",
                        style: TextStyle(
                          color: darkColor,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
