import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 8, left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 45,
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(.35),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Cari Nomor meja/Nama Pengunjung ",
            style: TextStyle(
              color: textColor,
              fontFamily: "Montserrat",
              fontSize: 13,
            ),
          ),
          SizedBox(width: 16),
          Icon(
            Icons.search,
            color: textColor,
          ),
        ],
      ),
    );
  }
}
