import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';

class MenungguMonitoring extends StatelessWidget {
  const MenungguMonitoring({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [putih.withOpacity(.25), putih.withOpacity(.15)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                height: 36,
                decoration: BoxDecoration(
                  border: Border.all(color: putih.withOpacity(.5)),
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TABLE 08 - (Masda agus)",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: textColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Baru saja",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: textColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: putih.withOpacity(.5), width: .5),
                  borderRadius: BorderRadius.circular(16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
