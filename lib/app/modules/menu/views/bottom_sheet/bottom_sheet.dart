// import 'dart:ui';

import 'dart:ui';

import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'components/card_chart.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 24,
          sigmaY: 24,
        ),
        child: Container(
          height: Get.height * .7,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                darkColor.withOpacity(.5),
                darkColor.withOpacity(.6),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 38),
                height: 4,
                width: 60,
                decoration: BoxDecoration(
                  color: lightColor.withOpacity(.6),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(
                            bottom: 16,
                            left: 24,
                            right: 24,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 16,
                          ),
                          // height: 64,
                          decoration: BoxDecoration(
                            color: lightColor.withOpacity(.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: Get.width * .48,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nasi Goreng Seafood",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: lightColor,
                                          fontFamily: "balsamiq",
                                          letterSpacing: 1,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                          "Rp23.000",
                                          style: TextStyle(
                                            color: iconColor,
                                            fontFamily: "balsamiq",
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 13),
                                        GestureDetector(
                                          onTap: () {
                                            print("tap notes");
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 2),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: hitam.withOpacity(.4),
                                                width: .5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              color: lightColor.withOpacity(.5),
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.notes_sharp,
                                                  size: 12,
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  "Notes",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: iconColor, width: 2),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                          child: Icon(
                                        Icons.remove,
                                        color: iconColor,
                                      )),
                                    ),
                                    SizedBox(width: 16),
                                    Text(
                                      "2",
                                      style: TextStyle(
                                        color: iconColor,
                                        fontFamily: "balsamiq",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: iconColor, width: 2),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                          child: Icon(
                                        Icons.add,
                                        color: iconColor,
                                      )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    Divider(
                      color: lightColor.withOpacity(.5),
                      thickness: 1,
                      indent: 25,
                      endIndent: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TOTAL",
                            style: TextStyle(
                              color: iconColor,
                              fontFamily: "balsamiq",
                            ),
                          ),
                          Text(
                            "Rp23.000",
                            style: TextStyle(
                              color: iconColor,
                              fontFamily: "balsamiq",
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(top: 32),
                        height: 50,
                        width: 184,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: darkColor,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              color: Colors.black.withOpacity(.35),
                              offset: Offset(4, 4),
                            ),
                            BoxShadow(
                              blurRadius: 8,
                              color: iconColor.withOpacity(.30),
                              offset: Offset(-4, -4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "ORDER",
                            style: TextStyle(
                              color: lightColor,
                              fontFamily: "balsamiq",
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40)
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
