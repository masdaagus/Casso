import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TableCard extends StatelessWidget {
  const TableCard({
    Key? key,
    this.guessName,
    this.isEmpty = true,
    required this.tableNumber,
    required this.onTap,
  }) : super(key: key);

  final int tableNumber;
  final String? guessName;
  final VoidCallback onTap;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: abu,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: darkColor.withOpacity(.2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  tableNumber.toString(),
                  style: TextStyle(
                    color: darkColor,
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
                    color: darkColor,
                  ),
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: (guessName == null)
                          ? biru.withOpacity(.5)
                          : orange.withOpacity(.5),
                    ),
                    child: Center(
                      child: Text(
                        guessName ?? 'KOSONG',
                        style: TextStyle(
                          fontSize: 10,
                          color: darkColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Ubuntu",
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
