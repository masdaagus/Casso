import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/users.dart';

class CardEmployeNews extends StatelessWidget {
  const CardEmployeNews({
    Key? key,
    required this.data,
    this.image,
    this.onTap,
  }) : super(key: key);

  final UsersModel data;
  final String? image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 14),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        width: double.infinity,
        decoration: BoxDecoration(
          color: lightColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: hitam.withOpacity(.25),
              offset: Offset(4, 4),
            ),
            BoxShadow(
              blurRadius: 4,
              color: putih.withOpacity(.55),
              offset: Offset(-4, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: abu,
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  image ?? "assets/images/head_people.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.status!,
                    style: TextStyle(
                      color: darkColor,
                      fontFamily: 'Ubuntu',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Email : ${data.email}",
                    style: TextStyle(
                      color: darkColor,
                      fontFamily: 'Ubuntu',
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Password : ${data.password ?? ''}",
                    style: TextStyle(
                      color: darkColor,
                      fontFamily: 'Ubuntu',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
