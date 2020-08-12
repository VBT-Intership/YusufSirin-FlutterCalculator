import 'package:calculator/Component/CalculatorButton.dart';
import 'package:calculator/Component/resultText.dart';
import 'package:calculator/Provider/calculatorprovider.dart';
import 'package:calculator/Util/Constants/lists.dart';
import 'package:calculator/Util/Enum/texttype.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            Spacer(),
            ResultText(
                textType: TextType.subtitle,
                text:
                    Provider.of<CalculatorViewProvider>(context).operationText),
            ResultText(
                text: Provider.of<CalculatorViewProvider>(context).result),
            calGridView(),
          ],
        ),
      ),
    );
  }

  GridView calGridView() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: AppList.buttonName.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index) {
        return CalculatorButton(
          text: AppList.buttonName[index],
          onTap: () {
            Provider.of<CalculatorViewProvider>(context, listen: false)
                .pushButton(AppList.buttonName[index]);
          },
        );
      },
    );
  }
}
