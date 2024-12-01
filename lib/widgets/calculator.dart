import 'package:flutter/material.dart';
import 'calc_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}


class _CalculatorState extends State<Calculator> {

  String eqn = '               ';
  ScrollController scrollController = ScrollController();

  /* Function to update display area */

  void resultCalc(String text){
    if(text == '='){
      setState(() {
        eqn += text;
        scrollController.jumpTo(scrollController.position.maxScrollExtent + 30);
      });
    }
    else if(text == '⌫'){
      if(eqn != '               ') {
        setState(() {
          eqn = eqn.substring(0, eqn.length - 1);
          scrollController.jumpTo(scrollController.position.maxScrollExtent + 30);
        });
      }
    }
    else if(text == 'AC'){
      setState(() {
        eqn = '               ';
      });
    }
    else if(text == '^'  || text == '%' || text == '/' || text == '*' || text == '-' || text == '+' ){
      if(eqn != '' ){
        setState(() {
          eqn += text;
          scrollController.jumpTo(scrollController.position.maxScrollExtent+30);
        });
      }
    }
    else{
      setState(() {
        eqn += text;
        scrollController.jumpTo(scrollController.position.maxScrollExtent+30);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [

          /* Result Area */

          Flexible(
            flex: 2,
            child: Container(
              color: Colors.grey[900],
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 75, 25, 10),
                        child: Text(
                          eqn,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          /* Buttons */

          Flexible(
            flex: 3,
            child:GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 4,
              children: <Widget>[
                CalcButton(btnText: 'AC', resulteqn: resultCalc,),
                CalcButton(btnText: '^', resulteqn: resultCalc,),
                CalcButton(btnText: '%', resulteqn: resultCalc,),
                CalcButton(btnText: '/', resulteqn: resultCalc,),
                CalcButton(btnText: '7', resulteqn: resultCalc,),
                CalcButton(btnText: '8', resulteqn: resultCalc,),
                CalcButton(btnText: '9', resulteqn: resultCalc,),
                CalcButton(btnText: '*', resulteqn: resultCalc,),
                CalcButton(btnText: '4', resulteqn: resultCalc,),
                CalcButton(btnText: '5', resulteqn: resultCalc,),
                CalcButton(btnText: '6', resulteqn: resultCalc,),
                CalcButton(btnText: '-', resulteqn: resultCalc,),
                CalcButton(btnText: '1', resulteqn: resultCalc,),
                CalcButton(btnText: '2', resulteqn: resultCalc,),
                CalcButton(btnText: '3', resulteqn: resultCalc,),
                CalcButton(btnText: '+', resulteqn: resultCalc,),
                CalcButton(btnText: '0', resulteqn: resultCalc,),
                CalcButton(btnText: '.', resulteqn: resultCalc,),
                CalcButton(btnText: '⌫', resulteqn: resultCalc,),
                CalcButton(btnText: '=', resulteqn: resultCalc,),
              ],
            ),
          ),
        ]

      )

    );
  }
}
