import 'package:casso/app/utils/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/controllers/auth_controller.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/splash_screen.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then((value) => Get.put(AuthController(), permanent: true));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
    return FutureBuilder(
      future: authC.autoLogin(),
      // future: Future.delayed(Duration(seconds: 1)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(() => GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Application",
                initialRoute: authC.isAuth.isTrue ? Routes.HOME : Routes.LOGIN,

                ////////////////////////////////////////////////
                // title: authC.isAuth.toString(),
                // initialRoute: Routes.DASHBOARD,
                getPages: AppPages.routes,
              ));
        }

        return SplashScreen();
      },
    );
  }
}
