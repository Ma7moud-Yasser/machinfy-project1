import 'package:flutter/material.dart';
import 'package:project_1/projects/bm_calculator/components/gender_selectionss.dart';
import 'package:project_1/projects/bm_calculator/components/height_selection.dart';
import 'package:project_1/projects/bm_calculator/components/weight_age_selection.dart';
import 'package:project_1/projects/bm_calculator/styles/colors.dart';

class BMScreen extends StatefulWidget {
  const BMScreen({super.key});

  @override
  State<BMScreen> createState() => _BMScreenState();
}

class _BMScreenState extends State<BMScreen> {
  String? selectedGender;
  double currentValue = 160;
  int weight = 50;
  int age = 20;
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.sizeOf(context).height * 0.03,
              bottom: 0,
              right: MediaQuery.sizeOf(context).height * 0.03,
              left: MediaQuery.sizeOf(context).height * 0.03,
            ),
            child: Column(
              children: [
                GenderSelections(selectedGender: selectedGender),
                HeightSelection(currentValue: currentValue),
                Row(
                  spacing: 15,
                  children: [
                    Expanded(
                      child: WeightAndAgeSelection(
                        valueName: "Weight",
                        value: weight,
                      ),
                    ),
                    Expanded(
                      child: WeightAndAgeSelection(
                        valueName: "Age",
                        value: age,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: MaterialButton(
              color: BMIColor.actionsColor,
              height: MediaQuery.sizeOf(context).height * 0.07,
              onPressed: () {},
              child: Text(
                "Calculate Your BMI",
                style: TextStyle(
                  color: BMIColor.whiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
