import 'package:calculator/Util/Theme/darktheme.dart';
import 'package:calculator/Util/Theme/lighttheme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _data = lightTheme;

  ThemeData get getTheme => _data;
  void setTheme(ThemeData tm) {
    _data = tm;
    notifyListeners();
  }
}
