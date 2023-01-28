import 'button/calc_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import 'controller.dart';

class Calc_Keyboard extends StatelessWidget {
  Calc_Keyboard({
    Key? key,
    required this.controller,
    this.buttonsStyle,
    this.buttonsSize,
    this.textColor = Colors.black,
  }) : super(key: key);
  final CalcKeysBinding controller;
  final Color textColor;
  final double? buttonsSize;
  final BoxDecoration? buttonsStyle;

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
                child: CalculButton(
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
                  child: CalculButton(
                    onPressed: controller.onEqual,
                    value: '=',
                    size: buttonsSize,
                    style: buttonsStyle,
                  )),
              GridPlacement(
                ///Remove button
                rowStart: 0, columnStart: 2,
                child: CalculButton(
                  onPressed: controller.onRemove,
                  size: buttonsSize,
                  style: buttonsStyle,

                  child: Center(
                      child: Icon(
                    Icons.backspace,
                    color: textColor,
                  )),
                ),
              ),
              GridPlacement(
                rowStart: 0,
                columnStart: 3,
                child: CalculButton(
                  value: '/',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: controller.onDivide,
                ),
              ),
              GridPlacement(
                child: CalculButton(
                  value: 'x²',
                  size: buttonsSize,
                  style: buttonsStyle,

                  onPressed: controller.onStepen,
                ),
              ),
              GridPlacement(
                rowStart: 0,
                columnStart: 0,
                child: CalculButton(
                  ///Clear button
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: controller.onClear,
                  value: 'C',
                ),
              ),
              GridPlacement(
                child: CalculButton(
                  value: '7',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: () {
                    controller.insert('7');
                  },
                ),
              ),
              GridPlacement(
                child: CalculButton(
                  value: '8',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: () {
                    controller.insert('8');
                  },
                ),
              ),
              GridPlacement(
                child: CalculButton(
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
                child: CalculButton(
                  onPressed: controller.onMinus,
                  value: '-',
                  size: buttonsSize,
                  style: buttonsStyle,
                ),
              ),
              GridPlacement(
                child: CalculButton(
                  value: '4',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: () {
                    controller.insert('4');
                  },
                ),
              ),
              GridPlacement(
                child: CalculButton(
                  value: '5',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: () {
                    controller.insert('5');
                  },
                ),
              ),
              GridPlacement(
                child: CalculButton(
                  value: '6',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: () {
                    controller.insert('6');
                  },
                ),
              ),
              GridPlacement(
                child: CalculButton(
                  value: '1',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: () {
                    controller.insert('1');
                  },
                ),
              ),
              GridPlacement(
                child: CalculButton(
                  value: '2',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: () {
                    controller.insert('2');
                  },
                ),
              ),
              GridPlacement(
                child: CalculButton(
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
                child: CalculButton(
                  onPressed: controller.onPlus,
                  value: '+',
                  size: buttonsSize,
                  style: buttonsStyle,
                ),
              ),
              GridPlacement(
                rowStart: 4,
                columnStart: 0,
                child: CalculButton(
                  value: '+/-',
                  size: buttonsSize,
                  style: buttonsStyle,
                  onPressed: controller.onToggleSign,
                ),
              ),
              GridPlacement(
                rowStart: 4,
                columnStart: 1,
                child: CalculButton(
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
                child: CalculButton(
                  value: ',',
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
