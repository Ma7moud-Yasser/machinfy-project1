import 'package:flutter/material.dart';
import 'package:project_1/projects/bm_calculator/styles/colors.dart';

class WeightAndAgeSelection extends StatefulWidget {
  int value = 50;
  String valueName;
  WeightAndAgeSelection(
      {super.key, required this.value, required this.valueName});

  @override
  State<WeightAndAgeSelection> createState() => _WeightAndAgeSelectionState();
}

class _WeightAndAgeSelectionState extends State<WeightAndAgeSelection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.03),
      decoration: BoxDecoration(
          color: BMIColor.secondaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(
            widget.valueName,
            style: TextStyle(
              color: BMIColor.greyColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${widget.value}",
            style: TextStyle(
              color: BMIColor.whiteColor,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: FloatingActionButton(
                  foregroundColor: BMIColor.whiteColor,
                  backgroundColor: BMIColor.secondaryColor,
                  shape: CircleBorder(),
                  onPressed: () {
                    setState(() {
                      widget.value++;
                    });
                  },
                  child: Icon(Icons.add),
                ),
              ),
              Expanded(
                child: FloatingActionButton(
                  foregroundColor: BMIColor.whiteColor,
                  backgroundColor: BMIColor.secondaryColor,
                  shape: CircleBorder(),
                  onPressed: () {
                    setState(() {
                      widget.value--;
                    });
                  },
                  child: Icon(Icons.remove),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
