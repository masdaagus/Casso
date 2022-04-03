import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    this.image,
  }) : super(key: key);

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 36, top: 16),
      height: Get.width - 154,
      width: Get.width - 154,
      decoration: BoxDecoration(
        border: Border.all(
          color: (image == null) ? abu : Colors.transparent,
        ),
        color: putih.withOpacity(.2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: (image == null)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt_outlined,
                  color: abu,
                  size: 100,
                ),
                SizedBox(height: 4),
                Text(
                  "ADD IMAGE",
                  style: TextStyle(
                    fontFamily: "balsamiq",
                    fontSize: 16,
                    color: abu,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Max size 200 kB",
                  style: TextStyle(
                    fontFamily: "balsamiq",
                    fontSize: 9,
                    color: abu,
                    // fontWeight: FontWeight,
                  ),
                )
              ],
            )
          : Padding(
              padding: EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
    );
  }
}
