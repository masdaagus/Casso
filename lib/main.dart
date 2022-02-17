import 'package:casso/app/utils/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: authC.autoLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(() => GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Application",
                initialRoute: authC.isAuth.isTrue ? Routes.HOME : Routes.LOGIN,
                // initialRoute: authC.isSkipIntro.isTrue
                //     ? authC.isAuth.isTrue
                //         ? Routes.HOME
                //         : Routes.LOGIN
                //     : Routes.INTRODUCTION,

                ////
                // title: authC.isAuth.toString(),
                // initialRoute: Routes.INTRODUCTION,
                getPages: AppPages.routes,
              ));
        }
        // return FutureBuilder(
        //   // future: authC.firstInitialzed(),
        //   builder: (context, snapshot) {
        return SplashScreen();
        //   },
        // );
      },
    );
  }
}
