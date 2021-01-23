import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({this.calculatorBrain});

  final CalculatorBrain calculatorBrain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Text(
              "Your Result",
              style: kTitleTextStyle,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 25, left: 10, bottom: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: kCardColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    calculatorBrain.getResult(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    calculatorBrain.calculateBMI(),
                    style: kBMITextStyle,
                  ),
                  Text(
                    calculatorBrain.getInterpretation(),
                    style: kBodyTextStyle,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: "RE-CALCULATE",
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
