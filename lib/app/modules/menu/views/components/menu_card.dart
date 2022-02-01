import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.image,
    required this.tittle,
    required this.harga,
  }) : super(key: key);
  final String image;
  final String tittle;
  final String harga;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            putih.withOpacity(.25),
            putih.withOpacity(.20),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 110,
                width: 110,
              ),
            ),
          ),
          SizedBox(height: 5),
          Divider(thickness: 2, color: putih.withOpacity(.3)),
          Text(
            tittle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: textColor,
              fontFamily: "Montserrat",
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6),
          Text(
            harga,
            style: TextStyle(
              fontSize: 11,
              color: textColor.withOpacity(.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
