import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({super.key, required this.btnText, required this.resulteqn});

  final String btnText;
  final Function resulteqn;

  @override
  Widget build(BuildContext context) {

  return GestureDetector(
    onTap: (){
      resulteqn(btnText);
    },
    child: Container(
        decoration: const BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.all(Radius.circular(60)),
        ),
        child: Center(
          child: Text(
            btnText,
            style: const TextStyle(
              fontSize: 45,
              color: Colors.white,
            ),
          ),
        ),
      ),
  );
  }
}
