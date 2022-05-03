// import 'package:flutter/material.dart';
// import 'package:casso/app/utils/constant.dart';

// class EmployeInfo extends StatelessWidget {
//   const EmployeInfo({
//     Key? key,
//     this.email,
//     this.password,
//     this.status,
//   }) : super(key: key);

//   final String? email;
//   final String? password;
//   final String? status;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           margin: const EdgeInsets.only(bottom: 8, top: 8),
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: abu,
//                   borderRadius: BorderRadius.circular(60),
//                 ),
//                 child: Icon(Icons.person, size: 32, color: darkColor),
//               ),
//               SizedBox(width: 16),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Email = ${email}",
//                     style: TextStyle(
//                       color: darkColor,
//                       fontFamily: 'Ubuntu',

//                       // fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   SizedBox(height: 2),
//                   Text(
//                     "Password = ${password}",
//                     style: TextStyle(
//                       color: darkColor,
//                       fontFamily: 'Ubuntu',
//                       // fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   SizedBox(height: 2),
//                   Text(
//                     "Status = ${status}",
//                     style: TextStyle(
//                       color: darkColor,
//                       fontFamily: 'Ubuntu',
//                       // fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         Divider(
//           thickness: .5,
//           color: darkColor.withOpacity(.2),
//           height: 0,
//         ),
//       ],
//     );
//   }
// }
