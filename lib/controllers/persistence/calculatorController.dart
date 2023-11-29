import 'package:math_expressions/math_expressions.dart';

class CalculatorController {
  String _expression = '';
  String _result = '';

  String get expression => _expression;
  String get result => _result;

  void addToExpression(String value) {
    _expression += value;
  }

  void clear() {
    _expression = '';
    _result = '';
  }

  void calculateExpression() {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(_expression);
      ContextModel contextModel = ContextModel();
      _result = exp.evaluate(EvaluationType.REAL, contextModel).toString();
    } catch (e) {
      _result = 'Error';
    }
  }
}