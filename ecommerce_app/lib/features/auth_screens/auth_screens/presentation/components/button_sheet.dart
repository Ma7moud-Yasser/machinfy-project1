// import 'package:flutter/material.dart';

// Future<String?> showAlertDialog(
//   BuildContext context,
//   String title, {
//   required List<String> countries,
// }) {
//   return showDialog<String>(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(
//           title,
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         content: Container(
//           width: double.maxFinite, // ✅ لجعل القائمة تأخذ عرض مناسب
//           child: ListView.builder(
//             shrinkWrap: true, // ✅ حتى لا تأخذ مساحة غير ضرورية
//             itemCount: countries.length,
//             itemBuilder: (context, index) {
//               List<String> countryParts = countries[index].split(" ");
//               String flag = countryParts[0]; // 🇪🇬 أو 🇷🇺
//               String countryName = countryParts.sublist(1).join(" ");

//               return ListTile(
//                 leading: Text(flag, style: TextStyle(fontSize: 24)),
//                 title: Text(countryName, style: TextStyle(fontSize: 18)),
//                 onTap: () {
//                   Navigator.pop(
//                     context,
//                     countryName,
//                   ); // ✅ إرجاع القيمة المختارة
//                 },
//               );
//             },
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context); // ❌ إغلاق بدون اختيار
//             },
//             child: Text("Cancel"),
//           ),
//         ],
//       );
//     },
//   );
// }
