import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'calc_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String eqn = '';
  ScrollController scrollController = ScrollController();
  final TextEditingController _controller = TextEditingController();

  /* Function to update display area */

  String evaluate() {
    try {
      Parser parser = Parser();
      ContextModel contextModel = ContextModel();
      Expression exp = parser.parse(eqn);
      double result = exp.evaluate(EvaluationType.REAL, contextModel);
      String result1 = result.toString();
      return result1;
    } catch (e) {
      return "";
    }
  }

  void resultCalc(String text) {
    if (text == '=') {
      setState(() {
        eqn = evaluate();
        _controller.text = eqn;
      });
    } else if (text == '⌫') {
      if (eqn != '') {
        setState(() {
          eqn = eqn.substring(0, eqn.length - 1);
          scrollController
              .jumpTo(scrollController.position.maxScrollExtent + 50);
          _controller.text = eqn;
        });
      }
    } else if (text == 'AC') {
      setState(() {
        eqn = '';
        _controller.text = eqn;
      });
    } else if (text == '^' ||
        text == '%' ||
        text == '/' ||
        text == '*' ||
        text == '-' ||
        text == '+') {
      if (eqn != '') {
        setState(() {
          eqn += text;
          scrollController
              .jumpTo(scrollController.position.maxScrollExtent + 50);
          _controller.text = eqn;
        });
      }
    } else {
      setState(() {
        eqn += text;
        scrollController.jumpTo(scrollController.position.maxScrollExtent + 50);
        _controller.text = eqn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          /* Result Area */

          Flexible(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              color: Colors.grey[900],
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: TextField(
                              controller: _controller,
                              readOnly: true,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 100,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /* Buttons */

          Flexible(
            flex: 3,
            child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              children: <Widget>[
                CalcButton(
                  btnText: 'AC',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '^',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '%',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '/',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '7',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '8',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '9',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '*',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '4',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '5',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '6',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '-',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '1',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '2',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '3',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '+',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '0',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '.',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '⌫',
                  resulteqn: resultCalc,
                ),
                CalcButton(
                  btnText: '=',
                  resulteqn: resultCalc,
                ),
              ],
            ),
          ),
        ]));
  }
}
