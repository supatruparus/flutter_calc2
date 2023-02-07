import 'package:arch_test/pages/calculator/data/const.dart';
import 'package:arch_test/pages/calculator/data/extensions/extensions.dart';
import 'package:arch_test/pages/calculator/data/result.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';
import '../presentation/widgets/widgets/calc_keyboard/controller.dart';
import 'calculator_repository.dart';
import 'providers/screen_provider.dart';

extension RemoveLast on String {
  String removeLast() {
    return substring(0, length - 1);
  }
}

class KeyBindings implements CalcKeysBinding {
  KeyBindings(this.ref);
  final WidgetRef ref;

  String get result => ref.read(resultProvider);
  ResultController get resultSize => ResultController(ref);
  MyMathRepository get calculator => MyMathRepository(ref: ref);
  TextEditingController get inputController => ref.read(inputControllerProvider);
  FocusNode get inputFocus => ref.read(inputFocusProvider);

  @override
  void onClear() {
    _onTap();
    calculator.clearScreen();
  }

  @override
  void onRemove() async {
    _onTap();
    inputController.text = inputController.text.removeLast();
    if (inputController.text.containsSome(calcOperators) && !inputController.text.characters.last.isOperator) {
      calculator.showResult();
    } else {
      calculator.result = '';
    }
  }

  @override
  void onDivide() {
    _onTap();
    inputSign('/');
  }

  @override
  void onMinus() async {
    _onTap();
    inputSign('-');
  }

  @override
  void onMultiply() async {
    Vibration.vibrate(duration: 50, amplitude: 20);
    inputFocus.unfocus();
    inputSign('×');
  }

  @override
  void onPlus() {
    _onTap();
    inputSign('+');
  }

  @override
  void onStepen() {
    _onTap();
    inputSign('^');
  }

  @override
  void onToggleSign() {}

  @override
  Future<void> insert(String string) async {
    _onTap();

    if (resultSize.isActive) {
      inputController.clear();
    }

    resultSize.set(false);
    ref.read(inputControllerProvider).text = ref.read(inputControllerProvider).text + string;

    if (inputController.text.containsSome(calcOperators)) {
      calculator.showResult();
    } else {
      ref.read(resultProvider.notifier).update((state) => '');
    }
  }

  @override
  void onEqual() async {
    _onTap();
    if (!inputController.text.characters.last.isOperator) {
      ///если последний символ не оператор
      if (inputController.text.containsSome(calcOperators)) {
        resultSize.set(true);
      }
    }
  }

  inputSign(String sign) {
    Vibration.vibrate(duration: 50, amplitude: 20);
    inputFocus.unfocus();
    if (inputController.text.isNotEmpty) {
      if (resultSize.isActive) {
        inputController.clear();
        inputController.text = result;
      }
      //
      if (inputController.text.characters.last.isOperator) {
        ///заменить знак
        inputController.text = inputController.text.replaceLast(sign);
      } else {
        ///добавить знак
        inputController.text = inputController.text + sign;
      }
      resultSize.set(false);
    }
  }

  _onTap() {
    Vibration.vibrate(duration: 50, amplitude: 20);
    inputFocus.unfocus();
  }
}
