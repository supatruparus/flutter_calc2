import 'package:arch_test/pages/calculator/const.dart';
import 'package:arch_test/pages/calculator/data/extensions/extensions.dart';
import 'package:arch_test/pages/calculator/data/input_controller_provider.dart';
import 'package:arch_test/pages/calculator/data/result.dart';
import 'package:arch_test/pages/calculator/data/result_size.dart';
import 'package:arch_test/pages/calculator/data/shadow_provider.dart';
import 'package:arch_test/pages/calculator/presentation/style.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/calc_keyboard/controller.dart';
import 'calculator_repository.dart';

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

  @override
  void onClear() {
    calculator.clearScreen();
  }

  @override
  void onRemove() {
    inputController.text = inputController.text.removeLast();
  }

  @override
  void onDivide() {
    inputSign('/');
  }

  @override
  void onMinus() {
    inputSign('-');
  }

  @override
  void onMultiply() {
    inputSign('×');
  }

  @override
  void onPlus() {
    inputSign('+');
  }

  @override
  void onStepen() {
    inputSign('^');
  }

  @override
  void onToggleSign() {}

  @override
  void insert(String string) {


    if(resultSize.isActive){
     inputController.clear();

    }

    resultSize.set(64);
    ref.read(inputControllerProvider).text = ref.read(inputControllerProvider).text + string;


    if(inputController.text.hasSign(calcOperators)){

      calculator.showResult();

    }else{
      ref.read(resultProvider.notifier).update((state) => '');
    }
  }

  @override
  void onEqual() {
    String result =
        CalculatorRepository.calculate(inputController.text.calcFormat()).toSimpleString();
    resultSize.set(96);
  }

  inputSign(String sign) {
    ref.read(shadowProvider.notifier).update((state) => BoxShadow());
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
}
