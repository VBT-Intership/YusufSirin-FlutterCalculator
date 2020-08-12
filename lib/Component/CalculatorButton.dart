import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final Function onTap;
  final String text;

  const CalculatorButton({Key key, this.onTap, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: text == "="
            ? Container(
                constraints: BoxConstraints.expand(),
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    shape: BoxShape.circle),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
              )
            : Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
      ),
    );
  }
}
