import 'package:flutter/material.dart';

import '../../../../../../../utils/constant.dart';

class CalculatorButtons extends StatelessWidget {
  CalculatorButtons({required this.onTap});

  // final VoidCallback onTap;

  final CalculatorButtonTapCallback onTap;
  final calculatorButtonRows = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['C', '0', '+'],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: calculatorButtonRows.map((calculatorRowButtons) {
      return CalculatorRow(
        buttons: calculatorRowButtons,
        onTap: onTap,
      );
    }).toList());
  }
}

class CalculatorRow extends StatelessWidget {
  CalculatorRow({required this.buttons, required this.onTap});

  final List<String> buttons;
  final CalculatorButtonTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: rowButtons(),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  List<Widget> rowButtons() {
    List<Widget> rowButtons = [];

    buttons.forEach((String buttonText) {
      rowButtons.add(
        CalculatorButton(
          text: buttonText,
          onTap: onTap,
        ),
      );
    });

    return rowButtons;
  }
}

typedef void CalculatorButtonTapCallback({String buttonText});

class CalculatorButton extends StatelessWidget {
  CalculatorButton({required this.text, required this.onTap});

  final String text;
  final CalculatorButtonTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: putih,
        child: GestureDetector(
          onTap: () => onTap(buttonText: text),
          child: Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: lightColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child:
                  Text(text, style: TextStyle(color: darkColor, fontSize: 24)),
            ),
          ),
        ),
      ),
    );
  }
}
