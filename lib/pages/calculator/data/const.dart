// ignore_for_file: constant_identifier_names

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

enum CalcButtons {
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
  static const Color screenTop = Color.fromRGBO(87, 87, 87, 1);
  static const Color darkGrey = Color.fromRGBO(36, 36, 36, 1);
  static const Color darkGrey__darker = Color.fromRGBO(26, 26, 26, 1);
  static const Color grey = Color.fromRGBO(30, 30, 30, 1);
  static const Color grey3lighter = Color.fromRGBO(45, 45, 45, 1);
  static List<Color> colorsList = [Colors.blue, Colors.green, Colors.red, Colors.yellow];
}

abstract class MyStrings {
  static String color = 'Цвет';
}

abstract class MyNeuStyles {
  static NeumorphicStyle circle = const NeumorphicStyle(
    lightSource: LightSource.topRight,
    shape: NeumorphicShape.convex,
    border: NeumorphicBorder(color: MyColors.darkGrey, width: 2),
    color: Colors.green,
    depth: 5,
    surfaceIntensity: 10,
    boxShape: NeumorphicBoxShape.circle(),
    intensity: 0.27,
  );

  static NeumorphicStyle darkGreyBeveled = NeumorphicStyle(
      color: MyColors.darkGrey.withOpacity(0.5),
      intensity: 0.6,
      depth: 2,
      shape: NeumorphicShape.concave,
      boxShape: NeumorphicBoxShape.beveled(const BorderRadius.all(Radius.circular(10))),
      surfaceIntensity: 0.5,
      shadowDarkColor: Colors.black87);
  static NeumorphicStyle defaultStyle = NeumorphicStyle(
      color: MyColors.darkGrey.withOpacity(0.5),
      intensity: 0.6,
      depth: 2,
      shape: NeumorphicShape.concave,
      boxShape: const NeumorphicBoxShape.rect(),
      surfaceIntensity: 0.5,
      shadowDarkColor: Colors.black87);
}
