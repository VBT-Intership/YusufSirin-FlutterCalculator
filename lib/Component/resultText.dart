import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  final String text;

  const ResultText({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: 20),
      child: Text(text),
    );
  }
}
