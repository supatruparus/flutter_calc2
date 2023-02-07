import 'package:arch_test/pages/calculator/data/const.dart';
import 'package:arch_test/pages/calculator/data/result.dart';
import 'package:arch_test/pages/calculator/domain/repository/math_repository.dart';
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

final inputControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

class MyMathRepository implements MathRepository {
  MyMathRepository({required this.ref});
  final WidgetRef ref;

  String get inputText => ref.read(inputControllerProvider).text;
  set inputText(String text) {
    ref.read(inputControllerProvider).text = text;
  }

  set result(String value) {
    ref.read(resultProvider.notifier).update((state) => value);
  }

  String get result => ref.read(resultProvider);
  @override
  num calculate(String string) {
    if (string.isNotEmpty && string != ' ' && string.characters.last.isOperator == false) {
      late final num result;
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
    num result = calculate(ref.read(inputControllerProvider).text.calcFormat());
    result.toStringAsExponential(10);
    if (result >= double.maxFinite) {
    } else {
    }
    ref.read(resultProvider.notifier).update((state) => result.toSimpleString());

  }

  @override
  String simplify(String string) {
    Parser parser = Parser();
    final expr = parser.parse(string).simplify();
    return expr.toString();
  }
}
