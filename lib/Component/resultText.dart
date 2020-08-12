import 'package:calculator/Util/Enum/texttype.dart';
import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  final String text;
  final TextType textType;

  const ResultText({Key key, this.text, this.textType = TextType.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: 20),
      child: Text(text,
          style: textType == TextType.title
              ? Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(color: Theme.of(context).primaryColor)
              : Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: Theme.of(context).primaryColor)),
    );
  }
}
