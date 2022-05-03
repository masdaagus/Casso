import 'package:flutter/material.dart';

import 'package:casso/app/utils/constant.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: putih,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              // onEditingComplete: update,
              // controller: controller,
              // onChanged: onChange,
              style: TextStyle(
                color: darkColor,
                fontFamily: "Ubuntu",
                fontSize: 13,
              ),
              decoration: InputDecoration(
                hintText: "Cari nama pegawai ",
                isDense: true,
                hintStyle: TextStyle(
                  color: darkColor.withOpacity(.7),
                  fontFamily: "Ubuntu",
                  fontSize: 13,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.search_outlined, color: darkColor)
        ],
      ),
    );
  }
}
