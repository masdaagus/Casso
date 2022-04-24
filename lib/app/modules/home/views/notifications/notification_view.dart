import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
          height: 80,
          width: double.infinity,
          color: darkColor,
          child: Center(
            child: Text(
              "Notification",
              style: TextStyle(
                color: lightColor,
                fontFamily: 'Ubuntu',
                letterSpacing: .5,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: abu,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.notifications_off_outlined,
                    size: 32,
                    color: darkColor,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "TIDAK ADA NOTIFIKASI",
                  style: TextStyle(
                    color: darkColor,
                    fontSize: 14,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
