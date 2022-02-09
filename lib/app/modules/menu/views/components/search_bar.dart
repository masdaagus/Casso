// import 'package:casso/app/data/constant.dart';
// import 'package:flutter/material.dart';

// class SearchBarMenu extends StatelessWidget {
//   const SearchBarMenu({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(16),
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       decoration: BoxDecoration(
//         color: putih.withOpacity(.15),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             child: TextField(
//               style: TextStyle(color: textColor),
//               decoration: InputDecoration(
//                 isDense: true,
//                 hintText: "Cari Nomor meja/Nama Pengunjung ",
//                 hintStyle: TextStyle(
//                   color: textColor.withOpacity(.7),
//                   fontFamily: "Montserrat",
//                   fontSize: 13,
//                 ),
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           SizedBox(width: 16),
//           Icon(
//             Icons.search,
//             color: textColor,
//           ),
//         ],
//       ),
//     );
//   }
// }
