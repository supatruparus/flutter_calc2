import 'package:arch_test/pages/calculator/const.dart';
import 'package:arch_test/pages/calculator/data/extensions/extensions.dart';
import 'package:arch_test/pages/calculator/data/input_controller_provider.dart';
import 'package:arch_test/pages/calculator/data/result.dart';
import 'package:arch_test/pages/calculator/data/shadow_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';
import '../widgets/calc_keyboard/controller.dart';
import 'calculator_repository.dart';
import 'screen_provider.dart';

extension RemoveLast on String {
  String removeLast() {
    return substring(0, length - 1);
  }
}

class KeyBindings implements CalcKeysBinding {
  KeyBindings(this.ref);
  final WidgetRef ref;
  ResultController get resultSize => ResultController(ref);
  CalculatorRepository get calculator => CalculatorRepository(ref: ref);
  TextEditingController get inputController => ref.read(inputControllerProvider);
  FocusNode get inputFocus => ref.read(inputFocusProvider);

  @override
  void onClear() {
    _onTap();
    calculator.clearScreen();
  }

  @override
  void onRemove() {
    _onTap();
    inputController.text = inputController.text.removeLast();
    if (inputController.text.hasSign(calcOperators) &&
        !inputController.text.characters.last.isOperator) {
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
  void onMinus() {
    _onTap();
    inputSign('-');
  }

  @override
  void onMultiply() {
    _onTap();
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
  void insert(String string) {
    _onTap();
    if (resultSize.isActive) {
      inputController.clear();
    }

    resultSize.set(64);
    ref.read(inputControllerProvider).text = ref.read(inputControllerProvider).text + string;

    if (inputController.text.hasSign(calcOperators)) {
      calculator.showResult();
    } else {
      ref.read(resultProvider.notifier).update((state) => '');
    }
  }

  @override
  void onEqual() {
    _onTap();
    resultSize.set(96);
  }

  inputSign(String sign) {
    _onTap();
    ref.read(shadowProvider.notifier).update((state) => const BoxShadow());
    resultSize.set(64);
    String inputText = inputController.text;
    if (inputText.characters.last.isOperator) {
      ///заменить знак
      inputController.text = inputController.text.replaceLast(sign);
    } else {
      ///добавить знак
      inputController.text = inputText + sign;
    }
  }

  _onTap() {
    Vibration.vibrate(duration: 50, amplitude: 5);
    inputFocus.unfocus();
  }
}
