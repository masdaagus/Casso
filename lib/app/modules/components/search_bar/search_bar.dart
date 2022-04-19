import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    this.onChange,
    this.hint,
  }) : super(key: key);

  final ValueChanged<String>? onChange;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: abu,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              onChanged: onChange,
              style: TextStyle(color: darkColor),
              decoration: InputDecoration(
                isDense: true,
                hintText: hint ?? "Cari Nomor meja/Nama Pengunjung",
                hintStyle: TextStyle(
                  color: darkColor.withOpacity(.5),
                  fontFamily: "Ubuntu",
                  fontSize: 13,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: 16),
          Icon(
            Icons.search,
            color: darkColor,
          ),
        ],
      ),
    );
  }
}
