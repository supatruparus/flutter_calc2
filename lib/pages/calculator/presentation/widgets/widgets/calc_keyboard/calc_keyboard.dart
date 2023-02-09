import 'package:arch_test/pages/calculator/presentation/calc_page/keyboard/button/calc_button.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import 'controller.dart';

class CalcKeyboardV1 extends StatelessWidget {
  const CalcKeyboardV1({
    Key? key,
    required this.controller,
    this.buttonsStyle,
    this.buttonsSize = double.infinity,
    required this.contentColor,
  }) : super(key: key);
  final CalcKeysBinding controller;
  final double? buttonsSize;
  final NeumorphicStyle? buttonsStyle;
  final Color contentColor;

  // final Widget button;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (details) {},
      child: Center(
        child: Center(
          child: LayoutGrid(
            gridFit: GridFit.passthrough,
            columnSizes: [1.fr, 1.fr, 1.fr, 1.fr],
            rowSizes: [1.fr, 1.fr, 1.fr, 1.fr, 1.fr],
            children: [
              GridPlacement(
                ///multiply button
                rowStart: 1, columnStart: 3,
                child: CalculatorButton(
                  onPressed: controller.onMultiply,
                  value: '×',
                  size: buttonsSize,
                  style: buttonsStyle,
                ),
              ),
              GridPlacement(

                  ///Equal Button

                  rowStart: 4,
                  columnStart: 3,
                  child: CalculatorButton(
                    onPressed: controller.onEqual,
                    value: '=',
                    size: buttonsSize,
                    style: buttonsStyle,
                  )),
              GridPlacement(
                ///Remove button
                rowStart: 0, columnStart: 2,
                child: CalculatorButton(
                  onPressed: controller.onRemove,
                  size: buttonsSize,
                  style: buttonsStyle,
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
                child: CalculatorButton(
                  value: '/',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: controller.onDivide,
                ),
              ),
              GridPlacement(
                child: CalculatorButton(
                  value: 'x²',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: controller.onStepen,
                ),
              ),
              GridPlacement(
                rowStart: 0,
                columnStart: 0,
                child: CalculatorButton(
                  ///Clear button
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: controller.onClear,
                  value: 'C',
                ),
              ),
              GridPlacement(
                child: CalculatorButton(
                  value: '7',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: () {
                    controller.insert('7');
                  },
                ),
              ),
              GridPlacement(
                child: CalculatorButton(
                  value: '8',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: () {
                    controller.insert('8');
                  },
                ),
              ),
              GridPlacement(
                child: CalculatorButton(
                  value: '9',
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
                child: CalculatorButton(
                  onPressed: controller.onMinus,
                  value: '-',
                  size: buttonsSize,
                  style: buttonsStyle,
                ),
              ),
              GridPlacement(
                child: CalculatorButton(
                  value: '4',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: () {
                    controller.insert('4');
                  },
                ),
              ),
              GridPlacement(
                child: CalculatorButton(
                  value: '5',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: () {
                    controller.insert('5');
                  },
                ),
              ),
              GridPlacement(
                child: CalculatorButton(
                  value: '6',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: () {
                    controller.insert('6');
                  },
                ),
              ),
              GridPlacement(
                child: CalculatorButton(
                  value: '1',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: () {
                    controller.insert('1');
                  },
                ),
              ),
              GridPlacement(
                child: CalculatorButton(
                  value: '2',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: () {
                    controller.insert('2');
                  },
                ),
              ),
              GridPlacement(
                child: CalculatorButton(
                  value: '3',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: () {
                    controller.insert('3');
                  },
                ),
              ),
              GridPlacement(
                rowStart: 3,
                columnStart: 3,
                child: CalculatorButton(
                  onPressed: controller.onPlus,
                  value: '+',
                  size: buttonsSize,
                  style: buttonsStyle,
                ),
              ),
              GridPlacement(
                rowStart: 4,
                columnStart: 0,
                child: CalculatorButton(
                  value: '+/-',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: controller.onToggleSign,
                ),
              ),
              GridPlacement(
                rowStart: 4,
                columnStart: 1,
                child: CalculatorButton(
                  onPressed: () {
                    controller.insert('0');
                  },
                  value: '0',
                  size: buttonsSize,
                  style: buttonsStyle,
                ),
              ),
              GridPlacement(
                rowStart: 4,
                columnStart: 2,
                child: CalculatorButton(
                  value: '.',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: () {
                    controller.insert('.');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
