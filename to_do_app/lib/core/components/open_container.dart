import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class CustomOpenContainer extends StatelessWidget {
  final Widget design;
  final Widget nextPage;
  const CustomOpenContainer(
      {super.key, required this.design, required this.nextPage});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (_, openContainer) {
        return design;
      },
      closedShape:
          BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
      openShape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
      closedElevation: 0,
      openElevation: 0,
      openBuilder: (_, closeContainer) {
        return nextPage;
      },
    );
  }
}
