import 'package:casso/app/controllers/notification_controller.dart';
import 'package:casso/app/modules/home/controllers/home_controller.dart';
import 'package:casso/app/modules/home/views/news/news_view.dart';
import 'package:casso/app/modules/home/views/notifications/notification_view.dart';
import 'package:casso/app/modules/home/views/settings/settings_view.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../tes.dart';
import 'home_view/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;
  final tabs = [
    Home(),
    NotificationView(),
    NewsView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(() => HomeController());
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: lightColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: darkColor,
      statusBarIconBrightness: Brightness.light,
    ));

    List<SalomonBottomBarItem> navBarList = [
      SalomonBottomBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
          selectedColor: darkColor),
      SalomonBottomBarItem(
          icon: Icon(Icons.notifications),
          title: Text("Notifikasi"),
          selectedColor: darkColor),
      SalomonBottomBarItem(
        icon: Icon(Icons.newspaper),
        title: Text("News"),
        selectedColor: darkColor,
      ),
      SalomonBottomBarItem(
        icon: Icon(Icons.settings_outlined),
        title: Text("Settings"),
        selectedColor: darkColor,
      ),
    ];

    return Scaffold(
      backgroundColor: lightColor,
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          itemPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          onTap: (i) {
            setState(() => _currentIndex = i);
          },
          items: navBarList),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: tabs[_currentIndex],
      ),
      // floatingActionButton: ElevatedButton(
      //     onPressed: () {
      //       Get.to(MasdaAgus());
      //     },
      //     child: Text("TES PRINTER")),
    );
  }
}
