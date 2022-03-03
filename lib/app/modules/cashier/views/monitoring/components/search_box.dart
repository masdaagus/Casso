import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 50,
      decoration: BoxDecoration(
        color: darkColor.withOpacity(.35),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text(
          //   "Cari Nomor meja/Nama Pengunjung ",
          //   style: TextStyle(
          //     color: textColor,
          //     fontFamily: "Montserrat",
          //     fontSize: 13,
          //   ),
          // ),
          Expanded(
            child: TextField(
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                hintText: "Cari Nomor meja/Nama Pengunjung ",
                hintStyle: TextStyle(
                  color: textColor,
                  fontFamily: "Montserrat",
                  fontSize: 13,
                ),
                border: InputBorder.none,
              ),
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
