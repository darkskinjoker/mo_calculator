import 'package:flutter/material.dart';
import 'package:mo_calculator/controllers/persistence/calculatorController.dart';
import 'package:mo_calculator/providers/CalculatorProvider.dart';


class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return CalculatorScreenState();
  }
}

class CalculatorScreenState extends State<CalculatorScreen> {
  CalculatorController calculatorController = CalculatorController();
  String display = '0';

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

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              onButtonPressed(buttonText);
            });
          },
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

  void onButtonPressed(String buttonText) {
    if (buttonText == 'C') {
      setState(() {
        display = '0';
        calculatorController.clear();
      });
    } else if (buttonText == '=') {
      setState(() {
        display = calculatorController.calculate();
      });
    } else {
      setState(() {
        display = calculatorController.handleInput(buttonText);
      });
    }
  }
}