import 'package:arch_test/pages/calculator/presentation/calc_page/keyboard/button/calc_button.dart';
import 'package:arch_test/pages/calculator/presentation/style.dart';
import 'package:arch_test/widgets/neu_vpuk_btn.dart';
import 'package:arch_test/widgets/neu_vpuk_v2.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller.dart';


class CalcKeyboardV2 extends StatelessWidget {
  const CalcKeyboardV2({
    Key? key,
    required this.controller,
    this.buttonsStyle,
    this.buttonsSize = double.infinity,
    this.textStyle = const TextStyle(),
    required this.contentColor,
  }) : super(key: key);
  final CalcKeysBinding controller;
  final double? buttonsSize;
  final NeumorphicStyle? buttonsStyle;
  final Color contentColor;
  final TextStyle textStyle;

  // final Widget button;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (details) {},
      child: LayoutGrid(

        gridFit: GridFit.loose,
        columnSizes: [1.fr, 1.fr, 1.fr, 1.fr],
        rowSizes: [1.fr, 1.fr, 1.fr, 1.fr, 1.fr],
        children: [
          GridPlacement(
            ///multiply button
            rowStart: 1, columnStart: 3,
            child: _CalculatorButton(
              onPressed: controller.onMultiply,
              value: '×',
              size: buttonsSize,
              textStyle: textStyle.copyWith(color: contentColor),
              style: buttonsStyle,
            ),
          ),
          GridPlacement(

            ///Equal Button

              rowStart: 4,
              columnStart: 3,
              child: _CalculatorButton(
                onPressed: controller.onEqual,
                value: '=',
                size: buttonsSize,
                textStyle: textStyle.copyWith(color: contentColor),
                style: buttonsStyle,
              )),
          GridPlacement(
            ///Remove button
            rowStart: 0, columnStart: 2,
            child: _CalculatorButton(
              onPressed: controller.onRemove,
              size: buttonsSize,
              style: buttonsStyle,
              textStyle: textStyle.copyWith(color: contentColor),
              child: Center(
                  child: Icon(
                    Icons.backspace,
                    color: contentColor,
                  )),
            ),
          ),
          GridPlacement(
            rowStart: 0,
            columnStart: 3,
            child: _CalculatorButton(
              value: '/',
              size: buttonsSize,
              style: buttonsStyle,
              textStyle: textStyle.copyWith(color: contentColor),
              onPressed: controller.onDivide,
            ),
          ),
          GridPlacement(
            child: _CalculatorButton(
              value: 'x²',
              size: buttonsSize,
              style: buttonsStyle,
              textStyle: textStyle.copyWith(color: contentColor),
              onPressed: controller.onStepen,
            ),
          ),
          GridPlacement(
            rowStart: 0,
            columnStart: 0,
            child: _CalculatorButton(
              ///Clear button
              size: buttonsSize,
              style: buttonsStyle,
              textStyle: textStyle.copyWith(color: contentColor),
              onPressed: controller.onClear,
              value: 'C',
            ),
          ),
          GridPlacement(
            child: _CalculatorButton(
              value: '7',
              size: buttonsSize,
              textStyle: textStyle.copyWith(color: contentColor),
              style: buttonsStyle,
              onPressed: () {
                controller.insert('7');
              },
            ),
          ),
          GridPlacement(
            child: _CalculatorButton(
              value: '8',
              size: buttonsSize,
              textStyle: textStyle.copyWith(color: contentColor),
              style: buttonsStyle,
              onPressed: () {
                controller.insert('8');
              },
            ),
          ),
          GridPlacement(
            child: _CalculatorButton(
              value: '9',
              textStyle: textStyle.copyWith(color: contentColor),
              size: buttonsSize,
              style: buttonsStyle,
              onPressed: () {
                controller.insert('9');
              },
            ),
          ),
          GridPlacement(
            rowStart: 2,
            columnStart: 3,
            child: _CalculatorButton(
              onPressed: controller.onMinus,
              value: '-',
              textStyle: textStyle.copyWith(color: contentColor),
              size: buttonsSize,
              style: buttonsStyle,
            ),
          ),
          GridPlacement(
            child: _CalculatorButton(
              value: '4',
              size: buttonsSize,
              style: buttonsStyle,
              textStyle: textStyle.copyWith(color: contentColor),
              onPressed: () {
                controller.insert('4');
              },
            ),
          ),
          GridPlacement(
            child: _CalculatorButton(
              value: '5',
              size: buttonsSize,
              style: buttonsStyle,
              textStyle: textStyle.copyWith(color: contentColor),
              onPressed: () {
                controller.insert('5');
              },
            ),
          ),
          GridPlacement(
            child: _CalculatorButton(
              value: '6',
              size: buttonsSize,
              textStyle: textStyle.copyWith(color: contentColor),
              style: buttonsStyle,
              onPressed: () {
                controller.insert('6');
              },
            ),
          ),
          GridPlacement(
            child: _CalculatorButton(
              value: '1',
              size: buttonsSize,
              style: buttonsStyle,
              textStyle: textStyle.copyWith(color: contentColor),
              onPressed: () {
                controller.insert('1');
              },
            ),
          ),
          GridPlacement(
            child: _CalculatorButton(
              value: '2',
              size: buttonsSize,
              style: buttonsStyle,
              textStyle: textStyle.copyWith(color: contentColor),
              onPressed: () {
                controller.insert('2');
              },
            ),
          ),
          GridPlacement(
            child: _CalculatorButton(
              value: '3',
              size: buttonsSize,
              style: buttonsStyle,
              textStyle: textStyle.copyWith(color: contentColor),
              onPressed: () {
                controller.insert('3');
              },
            ),
          ),
          GridPlacement(
            rowStart: 3,
            columnStart: 3,
            child: _CalculatorButton(
              onPressed: controller.onPlus,
              value: '+',
              size: buttonsSize,
              style: buttonsStyle,
              textStyle: textStyle.copyWith(color: contentColor),
            ),
          ),
          GridPlacement(
            rowStart: 4,
            columnStart: 0,
            child: _CalculatorButton(
              value: '+/-',
              size: buttonsSize,
              textStyle: textStyle.copyWith(color: contentColor),
              style: buttonsStyle,
              onPressed: controller.onToggleSign,
            ),
          ),
          GridPlacement(
            rowStart: 4,
            columnStart: 1,
            child: _CalculatorButton(
              onPressed: () {
                controller.insert('0');
              },
              value: '0',
              textStyle: textStyle.copyWith(color: contentColor),
              size: buttonsSize,
              style: buttonsStyle,
            ),
          ),
          GridPlacement(
            rowStart: 4,
            columnStart: 2,
            child: _CalculatorButton(
              value: '.',
              textStyle: textStyle.copyWith(color: contentColor),
              size: buttonsSize,
              style: buttonsStyle,
              onPressed: () {
                controller.insert('.');
              },
            ),
          ),
        ],
      ),
    );
  }
}


class _CalculatorButton extends StatelessWidget {
  const _CalculatorButton({
    Key? key,
    this.value = '',
    this.size,
    this.style,
    this.textStyle = const TextStyle(),
    this.animDuration = 100,
    required this.onPressed,
    // required this.button,
    this.child,
  }) : super(key: key);
  final String value;
  final int animDuration;
  final Function() onPressed;
  final Widget? child;
  final double fontSize = 32;
  final NeumorphicStyle? style;
  final double? size;
  final TextStyle textStyle;
  // final Widget button;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return NeuVpukV2.circle(
        onPressed: () async{
          onPressed();
        },
        child: Center(
          child: this.child ??
              Text(
                value,
                style: textStyle,
              ),
        ),
      );
    });
  }
}

