import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String display = '0';
  String expression = '';

  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        display = '0';
        expression = '';
      } else if (buttonText == '=') {
        try {
          double result = calculateExpression(expression);
          display = result.toString();
          expression = '';
        } catch (e) {
          display = 'Error';
          expression = '';
        }
      } else {
        expression += buttonText;
        display = expression;
      }
    });
  }

  double calculateExpression(String expression) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    return exp.evaluate(EvaluationType.REAL, cm);
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => onButtonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(List<String> buttonValues) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttonValues.map((btn) => buildButton(btn)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              display,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 24.0),
            buildRow(['7', '8', '9', '/']),
            const SizedBox(height: 16.0),
            buildRow(['4', '5', '6', 'x']),
            const SizedBox(height: 16.0),
            buildRow(['1', '2', '3', '-']),
            const SizedBox(height: 16.0),
            buildRow(['C', '0', '=', '+']),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}