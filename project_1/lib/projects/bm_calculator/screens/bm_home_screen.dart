import 'package:flutter/material.dart';
import 'package:project_1/projects/bm_calculator/components/gender_selectionss.dart';
import 'package:project_1/projects/bm_calculator/components/height_selection.dart';
import 'package:project_1/projects/bm_calculator/styles/colors.dart';

import '../components/gender_selection_component.dart';

class BMScreen extends StatefulWidget {
  const BMScreen({super.key});

  @override
  State<BMScreen> createState() => _BMScreenState();
}

class _BMScreenState extends State<BMScreen> {
  String? selectedGender;
  double currentValue = 160;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BMIColor.primaryColor,
      appBar: AppBar(
        backgroundColor: BMIColor.primaryColor,
        elevation: 2,
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text(
          'BM Calculator',
          style: TextStyle(
              color: BMIColor.whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).height * 0.03),
        child: Column(
          children: [
            GenderSelections(selectedGender: selectedGender),
            HeightSelection(currentValue: currentValue),
          ],
        ),
      ),
    );
  }
}
