import 'package:calculator/Util/Constants/lists.dart';
import 'package:calculator/Util/Extension/fouroperations.dart';
import 'package:calculator/Util/Extension/spacetrim.dart';
import 'package:flutter/material.dart';

class CalculatorViewProvider extends ChangeNotifier {
  List<String> _allResult = [];
  String _operationText = "", _result = "";

  String get result => _result;
  List<String> get allResult => _allResult;

  void pushButton(String button) {
    if (button == "=") {
      if (_isOperationContains(_operationText) &&
          !_isOperationContains(_operationText[_operationText.length - 1])) {
        print("işlem yap");
        _operation();
      } else {
        print("işlem yapma");
      }
    } else if (button == "Sil") {
      if (_operationText.length > 0) {
        _operationText = _operationText.substring(0, _operationText.length - 1);
      }
    } else if (button == "AC") {
      _operationText = "";
    } else if (AppList.fouroperations.contains(button) &&
        _isOperationContains(_operationText)) {
    } else {
      _operationText = _operationText + button;
    }
    print(_result);
  }

  bool _isOperationContains(String text) {
    bool isOperationContains = AppList.fouroperations.any((element) {
      if (text.contains(element)) {
        return true;
      } else {
        return false;
      }
    });
    return isOperationContains;
  }

  void _operation() {
    List<String> value = _operationText.spaceTrim();
    double first = double.parse(value[0]);
    double second = double.parse(value[2]);
    switch (value[1]) {
      case "+":
        _result = first.plus(second);
        break;
      case "-":
        _result = first.minus(second);
        break;
      case "*":
        _result = first.multiply(second);
        break;
      case "/":
        _result = first.divided(second);
        break;
    }
  }
}
