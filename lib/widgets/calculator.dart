import 'package:flutter/material.dart';
import 'calc_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}


class _CalculatorState extends State<Calculator> {

  String eqn = '';
  ScrollController scrollController = ScrollController();

  /* Function to update display area */

  void resultCalc(String text){
    if(text == '='){
      setState(() {
        eqn += text;
        scrollController.jumpTo(scrollController.position.maxScrollExtent + 50);
      });
    }
    else if(text == '⌫'){
      if(eqn != '') {
        setState(() {
          eqn = eqn.substring(0, eqn.length - 1);
          scrollController.jumpTo(scrollController.position.maxScrollExtent + 50);
        });
      }
    }
    else if(text == 'AC'){
      setState(() {
        eqn = '';
      });
    }
    else if(text == '^'  || text == '%' || text == '/' || text == '*' || text == '-' || text == '+' ){
      if(eqn != '' ){
        setState(() {
          eqn += text;
          scrollController.jumpTo(scrollController.position.maxScrollExtent+50);
        });
      }
    }
    else{
      setState(() {
        eqn += text;
        scrollController.jumpTo(scrollController.position.maxScrollExtent+50);
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
                        child: Text(
                          eqn,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
