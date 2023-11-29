import 'package:flutter/foundation.dart';

class CalculatorHistory {
  final String expression;
  final String result;
  final DateTime timestamp;

  CalculatorHistory({
    required this.expression,
    required this.result,
    required this.timestamp,
  });

  factory CalculatorHistory.fromMap(Map<String, dynamic> map) {
    return CalculatorHistory(
      expression: map['expression'] ?? '',
      result: map['result'] ?? '',
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'expression': expression,
      'result': result,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }
}