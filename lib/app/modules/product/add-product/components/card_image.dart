import 'dart:io';

import 'package:casso/app/modules/product/controllers/product_controller.dart';
import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    this.onTap,
    this.onCancel,
    this.image,
  }) : super(key: key);

  final String? image;
  final VoidCallback? onTap;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (c) => Container(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            margin:
                const EdgeInsets.only(left: 8, right: 8, bottom: 36, top: 16),
            height: Get.width - 154,
            width: Get.width - 154,
            decoration: BoxDecoration(
              border: Border.all(
                color: (c.pickedImage == null) ? putih : Colors.transparent,
              ),
              color: putih,
              borderRadius: BorderRadius.circular(24),
            ),
            child: (c.pickedImage != null)
                ? Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Container(
                            height: Get.width - 154,
                            width: Get.width - 154,
                            child: Image.file(
                              File(c.pickedImage!.path),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: GestureDetector(
                            onTap: onCancel,
                            child: Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: abu.withOpacity(.3),
                              ),
                              child: Icon(
                                Icons.cancel,
                                color: lightColor,
                              ),
                            )),
                      )
                    ],
                  )
                : (image != null)
                    ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Container(
                                height: Get.width - 154,
                                width: Get.width - 154,
                                child: Image.network(
                                  image!,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Positioned(
                            top: 16,
                            right: 16,
                            child: GestureDetector(
                                onTap: onCancel,
                                child: Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: abu.withOpacity(.3),
                                  ),
                                  child: Icon(
                                    Icons.cancel,
                                    color: lightColor,
                                  ),
                                )),
                          )
                        ],
                      )
                    : NoImage(),
          ),
        ),
      ),
    );
  }
}

class NoImage extends StatelessWidget {
  const NoImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.camera_alt_outlined,
          color: darkColor.withOpacity(.7),
          size: 100,
        ),
        SizedBox(height: 4),
        Text(
          "ADD IMAGE",
          style: TextStyle(
            fontFamily: "Ubuntu",
            fontSize: 16,
            color: darkColor.withOpacity(.7),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "Max size 200 kB",
          style: TextStyle(
            fontFamily: "Ubuntu",
            fontSize: 9,
            color: darkColor.withOpacity(.7),
            // fontWeight: FontWeight,
          ),
        )
      ],
    );
  }
}
