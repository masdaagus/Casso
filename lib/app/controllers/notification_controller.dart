import 'dart:convert';

import 'package:casso/app/utils/constant.dart';
import 'package:casso/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../data/models/resto.dart';
import '../data/models/users.dart';
import 'auth_controller.dart';

class NotificationController extends GetxController {
  final auth = Get.put(AuthController());
  var user = UsersModel().obs;
  var resto = RestosModel().obs;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> onMSgHandler(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification!.android;

    print("$android = {android}");
    print("$notification = {notification}");

    if (notification != null && android != null) {
      String _body = message.notification!.body ?? '';
      String _tittle = message.notification!.title ?? '';

      Get.snackbar(_tittle, _body,
          animationDuration: Duration(milliseconds: 600),
          duration: Duration(seconds: 12),
          borderRadius: 16,
          backgroundColor: lightColor.withOpacity(.7),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          boxShadows: [
            BoxShadow(
              blurRadius: 3,
              offset: Offset(2, 2),
              color: hitam.withOpacity(.3),
            )
          ],
          titleText: Text(
            _tittle,
            style: TextStyle(
              color: darkColor,
              fontFamily: 'Ubuntu',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          messageText: Text(
            _body,
            style: TextStyle(
              color: darkColor,
              fontFamily: 'Ubuntu',
            ),
          ));
    }
  }

  Future<void> bgMSgHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification!.android;

    print("$android = {android}");
    print("$notification = {notification}");

    if (notification != null && android != null) {
      String _body = message.notification!.body ?? '';
      String _tittle = message.notification!.title ?? '';

      await flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            color: Colors.red,
            icon: '@mipmap/ic_launcher',
          ),
        ),
      );

      Get.snackbar(_tittle, _body);
    }
  }

  Future<bool> payloadNotification({String? tittle, body}) async {
    final data = {
      'to': '/topics/${user.value.restoID}',
      "collapse_key": "type_a",
      "notification": {
        "title": tittle ?? 'TITTLE',
        "body": body ?? "BODY",
      },
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization': 'key = $serverKey'
    };

    try {
      final responses = await http.post(
        Uri.parse(googleFcm),
        headers: headers,
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
      );
      if (responses.statusCode == 200) {
        print('notification sended = status(${responses.statusCode})');
      }
    } catch (e) {
      print(e);
    }

    return true;
  }

  @override
  void onInit() async {
    user = auth.user;
    resto = auth.resto;

    super.onInit();
  }
}
