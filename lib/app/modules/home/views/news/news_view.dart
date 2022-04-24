import 'package:casso/app/data/models/users.dart';
import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/employe_info.dart';

class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());
    print("jumlah employe = ${c.cashier.length}");
    print("jumlah employe = ${c.waiters.length}");

    bool isShow = c.user.value.status == 'OWNER';

    return SafeArea(
        child: SingleChildScrollView(
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
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                // color: putih,
                ),
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
                          Divider(
                            thickness: .5,
                            color: darkColor.withOpacity(.2),
                            height: 0,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: c.employes.length,
                            itemBuilder: (context, index) {
                              UsersModel data = c.employes[index];
                              return EmployeInfo(
                                email: data.email,
                                password: data.password,
                                status: data.status,
                              );
                            },
                          ),
                        ],
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 24),
                  child: Text(
                    'BERITA',
                    style: TextStyle(
                      color: darkColor,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  height: 400,
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
                      SizedBox(height: 16),
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
          )
        ],
      ),
    ));
  }
}
