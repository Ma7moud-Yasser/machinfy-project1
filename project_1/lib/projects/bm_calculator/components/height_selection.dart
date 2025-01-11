import 'package:flutter/material.dart';
import 'package:project_1/projects/bm_calculator/styles/colors.dart';

class HeightSelection extends StatefulWidget {
  HeightSelection({super.key, required this.currentValue});
  double currentValue;

  @override
  State<HeightSelection> createState() => _HeightSelectionState();
}

class _HeightSelectionState extends State<HeightSelection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.03),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.03),
        decoration: BoxDecoration(
          color: BMIColor.secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              "HEIGHT",
              style: TextStyle(
                color: BMIColor.greyColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.01,
            ),
            RichText(
              text: TextSpan(
                text: widget.currentValue.toStringAsFixed(1),
                style: TextStyle(
                  color: BMIColor.whiteColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "  cm",
                    style: TextStyle(
                      color: BMIColor.greyColor,
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Slider(
              value: widget.currentValue,
              min: 100,
              max: 195,
              divisions: 160,
              label: widget.currentValue.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  widget.currentValue = value;
                });
              },
              activeColor: BMIColor.actionsColor,
              inactiveColor: BMIColor.greyColor,
            ),
          ],
        ),
      ),
    );
  }
}
