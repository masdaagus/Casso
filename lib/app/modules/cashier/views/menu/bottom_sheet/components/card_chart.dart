// import 'package:casso/app/data/constant.dart';
// import 'package:flutter/material.dart';

// class CardChart extends StatelessWidget {
//   const CardChart({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(left: 18, right: 18, bottom: 8),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: abu.withOpacity(.4),
//         // border: Border.all(
//         //   color: hitam.withOpacity(.4),
//         //   width: .5,
//         // ),
//         // gradient: LinearGradient(
//         //   colors: [
//         //     abu.withOpacity(.8),
//         //     abu.withOpacity(.5),
//         //   ],
//         //   begin: Alignment.topCenter,
//         //   end: Alignment.bottomCenter,
//         // ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Nasi Goreng Seafood",
//                 style: TextStyle(
//                     color: primaryColor,
//                     fontFamily: "Montserrat",
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16,
//                     letterSpacing: -1),
//               ),
//               SizedBox(height: 4),
//               Row(
//                 children: [
//                   Text(
//                     "Rp23.000",
//                     style: TextStyle(
//                         color: primaryColor,
//                         fontFamily: "Montserrat",
//                         fontWeight: FontWeight.w500,
//                         letterSpacing: -1),
//                   ),
//                   SizedBox(width: 8),
//                   notes()
//                 ],
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               IconsAddandMinus(
//                 child: Container(
//                   height: 2,
//                   color: hitam,
//                   margin: const EdgeInsets.all(4),
//                 ),
//                 onTap: () {},
//               ),

//               SizedBox(width: 18),
//               Text(
//                 "2",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontFamily: "Montserrat",
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               SizedBox(width: 18),

//               IconsAddandMinus(
//                 child: Icon(Icons.add),
//                 onTap: () {},
//               ),

//               // IconPlusMinus(Icons.add),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget notes() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: hitam.withOpacity(.4),
//           width: .5,
//         ),
//         borderRadius: BorderRadius.circular(6),
//         color: hitam.withOpacity(.16),
//       ),
//       child: Row(
//         children: [
//           Icon(
//             Icons.notes_sharp,
//             size: 12,
//           ),
//           SizedBox(width: 4),
//           Text(
//             "Notes",
//             style: TextStyle(
//               fontSize: 10,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class IconsAddandMinus extends StatelessWidget {
//   const IconsAddandMinus({
//     Key? key,
//     required this.child,
//     required this.onTap,
//   }) : super(key: key);

//   final Widget child;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 25,
//         width: 25,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//           color: Colors.transparent,
//           border: Border.all(
//             color: hitam.withOpacity(.4),
//             width: .5,
//           ),
//         ),
//         child: Center(child: child),
//       ),
//     );
//   }
// }
