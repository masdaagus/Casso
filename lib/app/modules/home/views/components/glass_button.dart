// import 'dart:ui';
// import 'package:casso/app/data/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// class GlassButton extends StatelessWidget {
//   const GlassButton({
//     Key? key,
//     required this.tittle,
//     required this.svg,
//     required this.onTap,
//   }) : super(key: key);

//   final String tittle;
//   final String svg;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 75,
//         width: Get.width * .18,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: Stack(
//             children: [
//               Positioned(
//                 right: 4,
//                 bottom: 4,
//                 child: Container(
//                   height: 32,
//                   width: 32,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: biru.withOpacity(.7),
//                   ),
//                 ),
//               ),
//               BackdropFilter(
//                 filter: ImageFilter.blur(
//                   sigmaX: 25,
//                   sigmaY: 25,
//                 ),
//                 child: Container(
//                   height: 75,
//                   width: Get.width * .18,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [putih.withOpacity(.25), putih.withOpacity(.15)],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: putih.withOpacity(.2)),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SvgPicture.asset(
//                         svg,
//                         height: 24,
//                         color: textColor,
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         tittle,
//                         style: TextStyle(
//                           color: textColor,  
//                           fontFamily: "Montserrat",
//                           fontSize: 11,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
