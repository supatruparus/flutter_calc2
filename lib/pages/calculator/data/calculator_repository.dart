import 'package:arch_test/pages/calculator/const.dart';
import 'package:arch_test/pages/calculator/data/input_controller_provider.dart';
import 'package:arch_test/pages/calculator/data/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';
import 'extensions/extensions.dart';

extension CalcFormat on String {
  String calcFormat() {
    String formattedString = '';
    if (isNotEmpty) {
      formattedString = replaceAll(',', '.');
      formattedString = formattedString.replaceAll('×', '*');
    }
    return formattedString;
  }
}

class CalculatorRepository {
  CalculatorRepository({required this.ref});
  final WidgetRef ref;
  set result(String value) {
    ref.read(resultProvider.notifier).update((state) => value);
  }

  String get result => ref.read(resultProvider);

  static double calculate(String string) {
    if (string.isNotEmpty && string != ' ' && string.characters.last.isOperator == false) {
      late final double result;
      try {
        double value = Parser().parse(string).evaluate(EvaluationType.REAL, ContextModel());
        if (value % 1 == 0) {
          result = value;
        } else {
          result = value;
        }
      } catch (e) {}
      return result;
    } else {
      throw Exception();
    }
  }

  void clearScreen() {
    ref.read(resultProvider.notifier).update((state) => '');
    ref.read(inputControllerProvider).clear();
  }

  showResult() {
    double result = calculate(ref.read(inputControllerProvider).text.calcFormat());
    ref.read(resultProvider.notifier).update((state) => '= ${result.toSimpleString()}');
  }
}
