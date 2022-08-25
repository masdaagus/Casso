import 'package:casso/app/controllers/notification_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/splash_screen.dart';

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp().then(
    (_) => Get.put(
      AuthController(),
      permanent: true,
    ),
  );

  runApp(MyApp());
  FlutterImageCompress.showNativeLog = true;
}

class MyApp extends StatelessWidget {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
    return FutureBuilder(
      future: authC.autoLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(
            () => GetMaterialApp(
              debugShowCheckedModeBanner: true,
              title: "Application ${authC.isAuth}",
              initialRoute: authC.isAuth.isTrue ? Routes.HOME : Routes.LOGIN,
              // initialRoute: Routes.TRANSACTION,
              getPages: AppPages.routes,
            ),
          );
        }

        return SplashScreen();
      },
    );
  }
}
