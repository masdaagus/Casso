import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class ButtonHistory extends StatelessWidget {
  const ButtonHistory({
    Key? key,
    this.tittle,
    this.onTap,
  }) : super(key: key);

  final String? tittle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 116,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            putih,
            orange.withOpacity(.4),
          ]),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: orange,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(Icons.history_toggle_off, size: 22),
            ),
            SizedBox(width: 8),
            Text(
              tittle ?? 'DAILY',
              style: TextStyle(
                color: darkColor,
                fontFamily: 'balsamiq',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
