import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: lightColor.withOpacity(.10),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(color: abu),
              decoration: InputDecoration(
                isDense: true,
                hintText: "Cari Nomor meja/Nama Pengunjung ",
                hintStyle: TextStyle(
                  color: abu.withOpacity(.7),
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
            color: abu,
          ),
        ],
      ),
    );
  }
}
