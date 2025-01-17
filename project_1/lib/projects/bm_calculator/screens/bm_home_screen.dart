import 'package:flutter/material.dart';
import 'package:project_1/projects/bm_calculator/components/gender_selectionss.dart';
import 'package:project_1/projects/bm_calculator/components/height_selection.dart';
import 'package:project_1/projects/bm_calculator/components/responsive_font.dart';
import 'package:project_1/projects/bm_calculator/components/weight_age_selection.dart';
import 'package:project_1/projects/bm_calculator/styles/colors.dart';
import 'package:project_1/projects/counter/home.dart';

class BMIScreen extends StatelessWidget {
   BMIScreen({super.key});

  String? selectedGender;
  static final route = '/page_2';
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
        title:  Text(
          'BMI Calculator',
          style: TextStyle(
              color: BMIColor.whiteColor,
              fontSize: responsiveFont(context, fontSize: 25),
              // fontSize:25,
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
                         heroTag1: '3',
                        heroTag2: '4',
                        valueName: "Weight",
                        value: weight,
                      ),
                    ),
                    Expanded(
                      child: WeightAndAgeSelection(
                        heroTag1: '1',
                        heroTag2: '2',
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
              onPressed: () {
              Navigator.pushNamed(context, MyHomePage.route,
               arguments: User(20, "Mohamed"),
               );
              // LIFO
              // Last In First Out
              
              },
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

class User {
  String name;
  int age;
  User(this.age,this.name);
}