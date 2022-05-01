import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  double num1 = 0.0;
  double num2 = 0.0;
  String preview = "";
  String operation = "";

  var txt = TextEditingController();

  void showSnackbar(text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  void generatePreview() {
    if (operation.isNotEmpty) {
      switch (operation) {
        case "addition":
          preview = txt.text + " +";
        break;
        case "subtraction":
          preview = txt.text + " -";
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator-inator'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextField(
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 16.0),
                    controller: txt)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  preview,
                  textAlign: TextAlign.end,
                )),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.seven),
                        onPressed: () {
                          setState(() {
                            txt.text = txt.text + "7";
                            generatePreview();
                          });
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.eight),
                        onPressed: () {
                          txt.text = txt.text + "8";
                          generatePreview();
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.nine),
                        onPressed: () {
                          txt.text = txt.text + "9";
                          generatePreview();
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.divide),
                        onPressed: () {
                          operation = "division";
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.four),
                        onPressed: () {
                          txt.text = txt.text + "4";
                          generatePreview();
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.five),
                        onPressed: () {
                          txt.text = txt.text + "5";
                          generatePreview();
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.six),
                        onPressed: () {
                          txt.text = txt.text + "6";
                          generatePreview();
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.xmark),
                        onPressed: () {
                          operation = "multiplication";
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.one),
                        onPressed: () {
                          txt.text = txt.text + "1";
                          generatePreview();
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.two),
                        onPressed: () {
                          txt.text = txt.text + "2";
                          generatePreview();
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.three),
                        onPressed: () {
                          txt.text = txt.text + "3";
                          generatePreview();
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.minus),
                        onPressed: () {
                          operation = "subtraction";
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.plusMinus),
                        onPressed: () {
                          txt.text = txt.text + "7";
                          generatePreview();
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.zero),
                        onPressed: () {
                          txt.text = txt.text + "0";
                          generatePreview();
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.equals),
                        onPressed: () {
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.plus),
                        onPressed: () {
                          operation = "addition";
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}