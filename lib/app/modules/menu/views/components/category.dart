import 'package:casso/app/data/constant.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16, top: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Categorie(tittle: 'Dessert'),
          Categorie(tittle: 'Drink'),
          Categorie(tittle: 'Food'),
          Categorie(tittle: 'All', pick: true),
          // Icon(Icons.search, color: textColor)
        ],
      ),
    );
  }
}

class Categorie extends StatelessWidget {
  const Categorie({
    Key? key,
    required this.tittle,
    this.pick = false,
  }) : super(key: key);

  final String tittle;
  final bool pick;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: pick ? putih.withOpacity(.16) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        tittle,
        style: TextStyle(
          color: pick ? textColor : Colors.grey[600],
          // fontSize: 16,
          fontFamily: "Montserrat",
          fontWeight: pick ? FontWeight.w500 : null,
        ),
      ),
    );
  }
}
