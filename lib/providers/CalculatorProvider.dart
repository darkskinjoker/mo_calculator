import 'package:flutter/widgets.dart';
import 'package:mo_calculator/entities/calculatorHistory.dart';
import '../controllers/persistence/calculatorController.dart';

class CalculatorProvider extends ChangeNotifier {
  CalculatorController controller = CalculatorController();

  // Get all calculator history records
  Future<List<CalculatorHistory>> getAllRecords() async {
    // Logic to fetch all records from a data source
    // For example, a database or a file
    // Example:
    // controller.init();
    // return controller.getAllRecords();
    return [];
  }

  // Save a calculator history record
  Future<void> saveRecord(CalculatorHistory history) async {
    // Logic to save the record to a data source
    // For example, a database or a file
    // Example:
    // controller.saveRecord(history);
    // notifyListeners();
  }
}