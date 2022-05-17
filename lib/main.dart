import 'package:casso/app/controllers/notification_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/splash_screen.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'id',
  'name',
  description: 'description',
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('MESSAGE BACKROUND ${message.messageId}');
}

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp().then(
    (_) => Get.put(
      AuthController(),
      permanent: true,
    ),
  );

  final fcm_controller = Get.put(NotificationController());

  FirebaseMessaging.onBackgroundMessage(
      (message) => fcm_controller.bgMSgHandler(message));

  FirebaseMessaging.onMessage.listen(
    (message) => fcm_controller.onMSgHandler(message),
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
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
      // future: Future.delayed(Duration(seconds: 0)), // tes widget
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(() => GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: "Application",
                initialRoute: authC.isAuth.isTrue ? Routes.HOME : Routes.LOGIN,

                ////////////////////////////////////////////////
                // title: authC.isAuth.toString(), // tes widget
                // initialRoute: Routes.PRINTER, // tes widget
                getPages: AppPages.routes,
              ));
        }

        return SplashScreen();
      },
    );
  }
}
