import 'package:casso/app/modules/home/views/tabs/kosong.dart';

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
      backgroundColor: lightColor,
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        buttonBackgroundColor: darkColor.withOpacity(.15),
        height: 65,
        index: 1,
        color: darkColor.withOpacity(.15),
        backgroundColor: lightColor,
        items: <Widget>[
          Icon(Icons.desktop_mac_outlined, size: 30, color: darkColor),
          Icon(Icons.home, size: 30, color: darkColor),
          Icon(Icons.person, size: 30, color: darkColor),
        ],
        onTap: (value) => setState(() => _curentIndex = value),
      ),
      body: tabs[_curentIndex],
    );
  }
}
