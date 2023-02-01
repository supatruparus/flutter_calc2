import 'package:flutter/material.dart';

enum CalcButtons {
  // ignore: constant_identifier_names
  REMOVE,
  CLEAR,
  DIVIDE,
  MUlTIPLY,
  CHANGE_SIGN,
}

const List<String> calcOperators = ['+', '-', '^', '/', '*', '×', '%'];

bool isOperator(String symbol) {
  bool isOperator = false;
  for (var op in calcOperators) {
    if (symbol == op) {
      isOperator = true;
      break;
    }
  }
  return isOperator;
}

extension IsOperator on String {
  bool get isOperator {
    bool isOperator = false;
    if (isEmpty) {
      isOperator = false;
      return isOperator;
    } else {
      for (var op in calcOperators) {
        if (this == op) {
          isOperator = true;
          break;
        }
      }
      return isOperator;
    }
  }
}

abstract class MyColors {
  static Color screenTop = const Color.fromRGBO(87, 87, 87, 1);
  static Color darkGrey = const Color.fromRGBO(36, 36, 36, 1);
  static List<Color> colorsList = [Colors.blue, Colors.green, Colors.red, Colors.yellow];
}

abstract class MyStrings {
  static String color = 'Цвет';
}
