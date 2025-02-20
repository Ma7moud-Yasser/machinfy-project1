import 'package:flutter/material.dart';

Future<String?> showButtonSheet(
  BuildContext context,
  String title, {
  required List<String> countries,
}) {
  return showModalBottomSheet<String>(
    context: context,
    showDragHandle: true,
    enableDrag: true,
    elevation: 2,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  List<String> countryParts = countries[index].split(" ");
                  String flag = countryParts[0]; // 🇪🇬 أو 🇷🇺
                  String countryName = countryParts.sublist(1).join(" ");

                  return ListTile(
                    leading: Text(flag, style: TextStyle(fontSize: 24)),
                    title: Text(countryName, style: TextStyle(fontSize: 18)),
                    onTap: () {
                      Navigator.pop(
                        context,
                        countryName,
                      ); // ✅ إرجاع القيمة المختارة
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
