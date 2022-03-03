import 'package:casso/app/modules/home/views/tabs/profile.dart';

import 'package:casso/app/utils/constant.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'tabs/home_tab/home_tab.dart';
import 'tabs/profile_tab/profile_tab.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _curentIndex = 1;
  final tabs = [
    TabProfile(),
    TabHome(),
    ProfileTab(),
  ];

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
