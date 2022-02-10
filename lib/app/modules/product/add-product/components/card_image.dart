import 'package:casso/app/data/constant.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    this.isNoImage = true,
  }) : super(key: key);

  final bool isNoImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 56, top: 16),
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: textColor),
        color: putih.withOpacity(.2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: isNoImage
          ? Column(
              children: [
                SizedBox(height: 40),
                Icon(
                  Icons.camera_alt_outlined,
                  color: textColor,
                  size: 100,
                ),
                SizedBox(height: 4),
                Text(
                  "ADD IMAGE",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Max size 200 kB",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 9,
                    color: textColor,
                    // fontWeight: FontWeight,
                  ),
                )
              ],
            )
          : Padding(
              padding: EdgeInsets.all(4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(21),
                child: Image.asset(
                  "assets/images/milkshake-oreo.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}
