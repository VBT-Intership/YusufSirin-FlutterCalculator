import 'package:flutter/material.dart';

class CalculatorViewProvider extends ChangeNotifier {
  List<String> _allResult = [];
  String _result;

  String get result => _result;
  List<String> get allResult => _allResult;

  void pushButton(String button) {
    print(button);
  }
}
