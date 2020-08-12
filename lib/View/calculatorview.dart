import 'package:calculator/Component/CalculatorButton.dart';
import 'package:calculator/Util/Constants/lists.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GridView.builder(
              shrinkWrap: true,
              itemCount: AppList.buttonName.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemBuilder: (context, index) {
                return CalculatorButton(
                  text: AppList.buttonName[index],
                  onTap: () {
                    print(AppList.buttonName[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
