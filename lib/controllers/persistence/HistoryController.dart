import 'package:mo_calculator/entities/calculatorHistory.dart';


abstract class CalculatorHistoryController {
  Future<void> init();
  Future<void> saveRecord(CalculatorHistory history);
  Future<List<CalculatorHistory>> getAllRecords();
}