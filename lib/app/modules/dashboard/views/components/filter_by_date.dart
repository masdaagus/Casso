import 'package:casso/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateFilter extends StatefulWidget {
  const DateFilter({
    Key? key,
  }) : super(key: key);

  @override
  State<DateFilter> createState() => _DateFilterState();
}

class _DateFilterState extends State<DateFilter> {
  bool _today = true;
  bool _weekly = false;
  bool _monthly = false;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
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
            ChoiceChip(
              label: Text(
                "Bulan ini",
                style: TextStyle(
                  color: lightColor,
                  fontFamily: 'Ubuntu',
                ),
              ),
              selected: _monthly,
              selectedColor: darkColor,
              backgroundColor: darkColor.withOpacity(.3),
              onSelected: (val) async {
                await controller.getMonthlyHistories();

                setState(() {
                  _today = false;
                  _weekly = false;
                  _monthly = true;
                });
              },
            ),
            SizedBox(width: 8),
            ChoiceChip(
              label: Text(
                "Minggu ini",
                style: TextStyle(
                  color: lightColor,
                  fontFamily: 'Ubuntu',
                ),
              ),
              selected: _weekly,
              selectedColor: darkColor,
              backgroundColor: darkColor.withOpacity(.3),
              onSelected: (val) async {
                // controller.isLoading = true;
                // controller.update();
                await controller.getWeeklyHistories();
                // controller.isLoading = false;
                // controller.update();
                setState(() {
                  _today = false;
                  _weekly = true;
                  _monthly = false;
                });
              },
            ),
            SizedBox(width: 8),
            ChoiceChip(
              label: Text(
                "Harin ini",
                style: TextStyle(
                  color: lightColor,
                  fontFamily: 'Ubuntu',
                ),
              ),
              selected: _today,
              selectedColor: darkColor,
              backgroundColor: darkColor.withOpacity(.3),
              onSelected: (val) async {
                await controller.getTodayHistories();

                setState(() {
                  _today = true;
                  _weekly = false;
                  _monthly = false;
                });
              },
            ),
            SizedBox(width: 8),
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
    return Container(margin: const EdgeInsets.only(left: 8));
  }
}
