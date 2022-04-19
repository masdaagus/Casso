import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

class PegawaiCard extends StatelessWidget {
  const PegawaiCard({
    Key? key,
    this.image,
    this.email,
    this.status,
  }) : super(key: key);

  final String? image;
  final String? email;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: abu, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16),
            height: 80,
            width: 80,
            child: Image.asset(image ?? "assets/images/avatar-1.png"),
          ),
          Column(
            children: [
              Text(
                "($status)".toUpperCase(),
                style: TextStyle(
                  color: darkColor,
                  fontFamily: "Ubuntu",
                ),
              ),
              SizedBox(height: 8),
              Text(
                "$email",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: darkColor,
                  fontFamily: "Ubuntu",
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
