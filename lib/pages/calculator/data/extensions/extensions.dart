import 'package:arch_test/pages/calculator/data/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension IsWhole on double {
  bool get isWhole {
    if (this % 1 == 0 || this == 0) {
      return true;
    } else {
      return false;
    }
  }
}

extension IsWholeNum on num {
  bool get isWhole {
    if (this % 1 == 0 || this == 0) {
      return true;
    } else {
      return false;
    }
  }
}

extension SimpleString on num {
  String toSimpleString() {
    if (isWhole || this == 0) {
      return toInt().toString();
    } else {
      return toStringAsFixed(6);
    }

  }
}

extension Replace on String {
  String replaceLast(String sign) {
    return replaceRange(length - 1, length, sign);
  }
}

extension HasSign on String {
  bool containsSome(List<String> characters) {
    ///Check if string contains something from array
    ///String str = '2+2'
    ///str.contains(['+', '-', '*']) / returns true

    bool isHasSign = false;
    for (var char in this.characters) {
      if (char.isOperator) {
        isHasSign = true;
        return isHasSign;
      } else {}
    }
    return isHasSign;
  }
}

extension Goodtext on Text {
  static goodText() {
    return Consumer(
      builder: (context, ref, child) => const Text('good'),
    );
  }
}
