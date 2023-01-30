import 'package:arch_test/pages/calculator/const.dart';
import 'package:flutter/material.dart';

extension IsWhole on double {
  bool get isWhole {
    if (this % 1 == 0 || this == 0) {
      return true;
    } else {
      return false;
    }
  }
}

extension SimpleString on double {
  String toSimpleString() {
    if (isWhole || this == 0) {
      return toInt().toString();
    } else {
      return toString();
    }
  }
}

extension Replace on String {
  String replaceLast(String sign) {
    return replaceRange(length - 1, length, sign);
  }
}

extension HasSign on String {
  bool hasSign(List<String> characters) {
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
