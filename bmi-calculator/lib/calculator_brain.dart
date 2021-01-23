import 'dart:math';

class CalculatorBrain {
  final int height, weight;

  double _bmi = 0;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    _bmi = (weight / pow(height / 100, 2));
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    _bmi = (weight / pow(height / 100, 2));
    if (_bmi >= 25) {
      return "You have a higher than normal body weight.";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight.";
    } else {
      return "You have a lower than normal body weight.";
    }
  }
}
