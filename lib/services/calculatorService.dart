import 'package:math_expressions/math_expressions.dart';

class CalculatorService {
  double calculateExpression(String expression) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      return exp.evaluate(EvaluationType.REAL, cm);
    } catch (e) {
      print('Error calculating expression: $e');
      return double.nan; // Return NaN for invalid expressions
    }
  }
}