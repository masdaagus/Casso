import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:casso/app/modules/home/views/home_view/home_view.dart';

import 'package:casso/app/modules/home/views/settings/settings_view.dart';
import 'package:casso/app/modules/home/views/transaction/transaction_view.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../cashier/views/cashier_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  final tabs = [
    // NotificationView(),
    // CashierView(),
    TransactionsView(),
    HomePage(),
    // NewsView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    List<BottomNavigationBarItem> navItems = [
      BottomNavigationBarItem(
          icon: Icon(Icons.assignment_outlined), label: 'Transaction'),
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
    ];

    return Scaffold(
      backgroundColor: lightColor,
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: tabs[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: navItems,
          currentIndex: _currentIndex,
          onTap: (i) {
            setState(() {
              _currentIndex = i;
            });
          }),
    );
  }
}
