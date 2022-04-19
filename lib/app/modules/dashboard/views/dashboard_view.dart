import 'package:casso/app/modules/dashboard/views/components/top_card.dart.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import 'components/best_product.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: lightColor,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: darkColor,
    ));
    controller.user.value.name;
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20, color: lightColor),
          onPressed: Get.back,
        ),
        backgroundColor: darkColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Text(
            'DASHBOARD',
            style: TextStyle(
              color: lightColor,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          DateFilter(),
          Container(
            padding: const EdgeInsets.only(left: 16, top: 78),
            height: 160,
            width: double.infinity,
            color: darkColor,
            child: Text(
              "Ringkasan 19 April 2022",
              style: TextStyle(
                fontFamily: 'Ubuntu',
                color: lightColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 115),
            child: Column(
              children: [
                TopCard(),
                BestProduct(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DateFilter extends StatelessWidget {
  const DateFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 50,
        width: Get.width,
        color: bgColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonFilter(tittle: 'Bulan ini'),
            ButtonFilter(tittle: 'Minggu ini'),
            ButtonFilter(tittle: 'Hari ini', isPressed: true),
          ],
        ),
      ),
    );
  }
}

class ButtonFilter extends StatelessWidget {
  const ButtonFilter({
    Key? key,
    this.tittle,
    this.onTap,
    this.isPressed = false,
  }) : super(key: key);
  final String? tittle;
  final VoidCallback? onTap;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: isPressed ? darkColor : darkColor.withOpacity(.4),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            "$tittle",
            style: TextStyle(
              fontFamily: 'Ubuntu',
              color: lightColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
