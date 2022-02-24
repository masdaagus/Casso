import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardTable extends StatelessWidget {
  const CardTable({
    Key? key,
    required this.tableNumber,
    this.guessName = 'KOSONG ',
    required this.onTap,
  }) : super(key: key);

  final int tableNumber;
  final String guessName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: putih.withOpacity(.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Color(0XFF443F51),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
              ),
              child: Center(
                child: Text(
                  tableNumber.toString(),
                  style: TextStyle(
                    color: textColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/table.svg",
                        height: 45,
                      ),
                      SizedBox(height: 2),
                      Text(
                        "TABLE",
                        style: TextStyle(
                          color: textColor,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: orange.withOpacity(.7),
                    ),
                    child: Center(
                      child: Text(
                        guessName,
                        style: TextStyle(
                          fontSize: 10,
                          color: darkColor,
                          fontWeight: FontWeight.w500,
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
