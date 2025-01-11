import 'package:flutter/material.dart';
import 'package:project_1/projects/bm_calculator/styles/colors.dart';

class GenderSelectionComponent extends StatelessWidget {
  const GenderSelectionComponent({
    required this.gender,
    required this.icon,
    required this.isSelected,
    super.key,
  });

  final String gender;
  final IconData? icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.03),
      decoration: BoxDecoration(
        color: isSelected ? BMIColor.actionsColor : BMIColor.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: MediaQuery.sizeOf(context).height * 0.09,
            color: BMIColor.whiteColor,
          ),
          Text(
            gender,
            style: TextStyle(
              color: BMIColor.whiteColor,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
