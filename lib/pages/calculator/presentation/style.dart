import 'package:arch_test/pages/calculator/data/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class _Style extends BoxDecoration {
  const _Style(
      {super.border,
      super.borderRadius,
      super.gradient,
      this.padding = EdgeInsets.zero,
      this.textStyle});
  final TextStyle? textStyle;
  final EdgeInsets padding;
}

var primaryColor = Colors.lightBlueAccent;

TextStyle inputStyle = const TextStyle(
    fontFamily: 'Changa',
    height: 1,
    fontSize: 48,
    /*backgroundColor: Colors.green,*/ overflow: TextOverflow.clip);

BoxDecoration circButton = BoxDecoration(
    color: Colors.grey,
    gradient: const LinearGradient(
        colors: [Color.fromRGBO(123, 123, 123, 1), Color.fromRGBO(170, 170, 170, 1)]),
    boxShadow: [
      BoxShadow(color: Colors.black.withOpacity(0.40), offset: const Offset(-8, 4), blurRadius: 10)
    ],
    borderRadius: const BorderRadius.all(Radius.circular(50)));

const TextStyle buttonsText = TextStyle(
  fontFamily: 'Changa',
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
final buttonsStyle = NeumorphicStyle(
  lightSource: LightSource.topRight,
  shape: NeumorphicShape.concave,
  color: primaryColor,
  depth: 8,
  surfaceIntensity: 5,
  boxShape: NeumorphicBoxShape.circle(),
  intensity: 0.27,
);
const resultStyle = _Style(
  textStyle: TextStyle(
      fontFamily: 'Changa',
      fontSize: 56,
      height: 1,
      shadows: [Shadow(offset: Offset(1, 4), color: Colors.white12, blurRadius: 10)]),
  gradient: LinearGradient(colors: []),
);

final screenStyle = _Style(
    textStyle: const TextStyle(),
    padding: const EdgeInsets.only(right: 12),
    gradient: LinearGradient(
        colors: [MyColors.darkGrey, MyColors.screenTop],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter));
final backgroundColor = MyColors.darkGrey;
