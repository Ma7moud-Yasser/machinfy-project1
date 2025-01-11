import 'package:flutter/material.dart';
import 'package:project_1/projects/bm_calculator/components/gender_selection_component.dart';

class GenderSelections extends StatefulWidget {
  GenderSelections({super.key, this.selectedGender});
  String? selectedGender;
  @override
  State<GenderSelections> createState() => _GenderSelectionsState();
}

class _GenderSelectionsState extends State<GenderSelections> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.selectedGender = "Male";
              });
            },
            child: GenderSelectionComponent(
              gender: "Male",
              icon: Icons.male,
              isSelected: widget.selectedGender == "Male",
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                widget.selectedGender = "Female";
              });
            },
            child: GenderSelectionComponent(
              gender: "Female",
              icon: Icons.female,
              isSelected: widget.selectedGender == "Female",
            ),
          ),
        ),
      ],
    );
  }
}
