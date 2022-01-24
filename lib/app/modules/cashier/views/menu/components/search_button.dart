import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24, top: 16, bottom: 24),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 35,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            putih.withOpacity(.25),
            putih.withOpacity(.25),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Search..",
            style: TextStyle(
              color: textColor.withOpacity(.8),
              fontFamily: "Montserrat",
              fontSize: 12,
            ),
          ),
          Icon(
            Icons.search,
            size: 20,
            color: putih,
          )
        ],
      ),
    );
  }
}
