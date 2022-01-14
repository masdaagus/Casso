import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [putih.withOpacity(.25), putih.withOpacity(.15)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: putih.withOpacity(.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          tanggalPenjualan(),
          tottalPenjualan(),
          SizedBox(height: 8),
          customDivider(),
          rincianPenjualan("Makanan  = 320.000"),
          rincianPenjualan("Minuman = 320.000"),
          rincianPenjualan("Dessert     = 320.000"),
          SizedBox(height: padding / 2)
        ],
      ),
    );
  }

  Widget rincianPenjualan(String text) {
    return Container(
      padding: EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget customDivider() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: padding / 2),
        height: 2,
        width: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              biru.withOpacity(.20),
              orange.withOpacity(.20),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  /// [Tanggal penjualan hari ini]
  Widget tanggalPenjualan() {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(bottom: 16),
      child: Text(
        "Penjualan 7 Juni",
        style: TextStyle(
          fontFamily: "Montserrat",
          color: textColor,
          fontSize: 12,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: putih.withOpacity(.1)),
        gradient: LinearGradient(
          colors: [
            biru.withOpacity(.10),
            orange.withOpacity(.10),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

  /// [Total penjualan hari ini]
  Widget tottalPenjualan() {
    return Center(
      child: Text(
        "840.000",
        style: TextStyle(
          color: textColor,
          fontFamily: "Monserrat",
          fontSize: 36,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
