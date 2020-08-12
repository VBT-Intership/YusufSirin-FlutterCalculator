import 'package:calculator/Provider/calculatorprovider.dart';
import 'package:calculator/Provider/themeprovider.dart';
import 'package:calculator/View/calculatorview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => CalculatorViewProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: Provider.of<ThemeProvider>(context).getTheme,
      home: CalculatorView(),
    );
  }
}
