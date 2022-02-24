import 'dart:ui';
import 'package:casso/app/controllers/auth_controller.dart';
import 'package:casso/app/modules/home/views/components/tes.dart';
import 'package:casso/app/modules/home/views/tabs/profile.dart';
import 'package:casso/app/modules/profile/views/profile_view.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tabs/home_tab.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final auth = Get.put(AuthController());
  int _curentIndex = 1;
  final tabs = [TabProfile(), TabHome(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        buttonBackgroundColor: putih.withOpacity(.08),
        height: 65,
        index: 1,
        color: putih.withOpacity(.05),
        backgroundColor: darkColor,
        items: <Widget>[
          Icon(Icons.desktop_mac_outlined, size: 30, color: iconColor),
          Icon(Icons.home, size: 30, color: iconColor),
          Icon(Icons.person, size: 30, color: iconColor),
        ],
        onTap: (value) => setState(() => _curentIndex = value),
      ),
      body: tabs[_curentIndex],
    );
  }
}
