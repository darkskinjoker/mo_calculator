import 'package:flutter/material.dart';

class CalculatorWidget extends StatelessWidget {
  CalculatorWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 80, bottom: 60),
          child: Text(
            'Calculator',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
          ),
        ),
        Text(
          'Output:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        Text(
          'Display your result here',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('7'),
            _buildButton('8'),
            _buildButton('9'),
            _buildButton('/'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('4'),
            _buildButton('5'),
            _buildButton('6'),
            _buildButton('x'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('1'),
            _buildButton('2'),
            _buildButton('3'),
            _buildButton('-'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton('C'),
            _buildButton('0'),
            _buildButton('='),
            _buildButton('+'),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () {
            // Implement button press logic
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
}