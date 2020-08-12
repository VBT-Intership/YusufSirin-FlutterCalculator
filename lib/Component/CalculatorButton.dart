import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Function onTap;
  final String text;

  const CalculatorButton({Key key, this.onTap, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(text),
    );
  }
}
