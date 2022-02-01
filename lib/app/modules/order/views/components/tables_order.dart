import 'package:casso/app/data/constant.dart';
import 'package:casso/app/modules/components/tables/card_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TablesOrder extends StatelessWidget {
  const TablesOrder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, top: 24, right: 24),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 3,
                childAspectRatio: .85,
                physics: BouncingScrollPhysics(),
                children: List.generate(19, (index) {
                  return CardTable(
                    tableNumber: index + 1,
                    onTap: () {
                      print("pencet table ${index + 1}");
                      Get.defaultDialog(
                        content: Column(
                          children: [
                            Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: putih,
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: primaryColor.withOpacity(.7),
                                    fontSize: 13,
                                    letterSpacing: -.5,
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Masukkan nama pengunjung . . .",
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.offNamed("/menu");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Pilih makanan",
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 14,
                                        fontFamily: "Montserrat",
                                      ),
                                    ),
                                  ],
                                ),
                                style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  primary: primaryColor.withOpacity(.8),
                                ),
                              ),
                            )
                          ],
                        ),
                        title: "TABLE ${index + 1}",
                        titleStyle: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                        ),
                        backgroundColor: putih.withOpacity(.7),
                        radius: 10,
                        contentPadding: EdgeInsets.symmetric(horizontal: 24),
                      );
                    },
                  );
                }),
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
