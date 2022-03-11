import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      decoration: BoxDecoration(
        color: lightColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                hintText: "Cari Nomor meja/Nama Pengunjung ",
                isDense: true,
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
