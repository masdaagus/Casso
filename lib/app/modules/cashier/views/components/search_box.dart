import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 32,
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
              style: TextStyle(
                color: darkColor,
                fontFamily: "balsamiq",
                fontSize: 13,
              ),
              decoration: InputDecoration(
                hintText: "Cari Nomor meja/Nama Pengunjung ",
                isDense: true,
                hintStyle: TextStyle(
                  color: darkColor.withOpacity(.7),
                  fontFamily: "balsamiq",
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
            size: 16,
          ),
        ],
      ),
    );
  }
}
