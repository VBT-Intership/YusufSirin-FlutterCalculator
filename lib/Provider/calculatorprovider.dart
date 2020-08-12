import 'package:calculator/Util/Constants/lists.dart';
import 'package:calculator/Util/Extension/fouroperations.dart';
import 'package:calculator/Util/Extension/spacetrim.dart';
import 'package:flutter/material.dart';

class CalculatorViewProvider extends ChangeNotifier {
  String _operationText = "", _result = "";
  bool _resultShow = false;

  String get result => _result;
  String get operationText => _operationText;

  void pushButton(String button) {
    if (button == "=") {
      if (_isOperationContains(_operationText) &&
          !_isOperationContains(_operationText[_operationText.length - 1])) {
        _operation();
        _resultShow = true;
      } else {}
    } else if (button == "Sil") {
      if (_operationText.length > 0) {
        _operationText = _operationText.substring(0, _operationText.length - 1);
      }
      _resultShow = false;
    } else if (button == "AC") {
      _operationText = "";
      _result = "";
    } else if (AppList.fouroperations.contains(button) &&
        _isOperationContains(_operationText)) {
    } else {
      if (_resultShow) {
        _operationText = "";
        _resultShow = false;
        print("object");
      }
      _operationText = _operationText + button;
    }
    notifyListeners();
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
