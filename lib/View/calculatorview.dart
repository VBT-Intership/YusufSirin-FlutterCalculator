import 'package:calculator/Component/CalculatorButton.dart';
import 'package:calculator/Component/resultText.dart';
import 'package:calculator/Provider/calculatorprovider.dart';
import 'package:calculator/Provider/themeprovider.dart';
import 'package:calculator/Util/Constants/lists.dart';
import 'package:calculator/Util/Enum/texttype.dart';
import 'package:calculator/Util/Theme/darktheme.dart';
import 'package:calculator/Util/Theme/lighttheme.dart';
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
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ResultText(
                    textType: TextType.subtitle,
                    text: Provider.of<CalculatorViewProvider>(context)
                        .operationText),
                ResultText(
                    text: Provider.of<CalculatorViewProvider>(context).result),
                calGridView(),
              ],
            ),
            SafeArea(
              child: InkWell(
                onTap: () {
                  var themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  if (themeProvider.getTheme == lightTheme) {
                    themeProvider.setTheme(darkTheme);
                  } else {
                    themeProvider.setTheme(lightTheme);
                  }
                },
                child: Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Theme.of(context).primaryColor),
                  ),
                  child: Icon(
                    Icons.sync_alt,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
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
