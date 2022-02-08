import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: putih.withOpacity(.15),
        borderRadius: BorderRadius.circular(16),
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
