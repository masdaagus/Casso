import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.image,
    required this.tittle,
    required this.harga,
    this.itemCount = 0,
    this.onTap,
  }) : super(key: key);

  final String image;
  final String tittle;
  final String harga;
  final int itemCount;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              putih.withOpacity(.25),
              putih.withOpacity(.20),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: 110,
                  width: 110,
                ),
              ),
            ),
            SizedBox(height: 5),
            Divider(thickness: 2, color: putih.withOpacity(.3)),
            Text(
              tittle,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: textColor,
                fontFamily: "Montserrat",
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 6),
            Text(
              harga,
              style: TextStyle(
                fontSize: 11,
                color: textColor.withOpacity(.7),
                fontWeight: FontWeight.w500,
              ),
            ),
            itemCount == 0
                ? Container()
                : Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: hitam.withOpacity(.2),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: putih.withOpacity(.5),
                          width: .3,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          itemCount.toString(),
                          style: TextStyle(
                            color: textColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
