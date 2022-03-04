import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TableCard extends StatelessWidget {
  const TableCard({
    Key? key,
    required this.tableNumber,
    this.guessName = 'KOSONG ',
    required this.onTap,
    this.isEmpty = true,
  }) : super(key: key);

  final int tableNumber;
  final String guessName;
  final VoidCallback onTap;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: lightColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: darkColor.withOpacity(.7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  tableNumber.toString(),
                  style: TextStyle(
                    color: lightColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/svg/table_bar.svg",
                    height: 50,
                  ),
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isEmpty
                          ? biru.withOpacity(.5)
                          : orange.withOpacity(.5),
                    ),
                    child: Center(
                      child: Text(
                        guessName,
                        style: TextStyle(
                          fontSize: 10,
                          color: lightColor,
                          fontFamily: "balsamiq",
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
