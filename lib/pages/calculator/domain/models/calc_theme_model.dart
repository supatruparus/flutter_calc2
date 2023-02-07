import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CalculatorTheme {
  CalculatorTheme({
    this.buttonStyle = const NeumorphicStyle(),
    this.backgroundColor = Colors.grey,
    this.primaryColor = Colors.blue,
    this.textStyle,
    this.screenColor,
    this.buttonText = const TextStyle(),
    this.buttonsAnimSpeed = 200,
    this.inputStyle = const TextStyle(
        fontFamily: 'Changa',
        height: 1,
        fontSize: 48,
        color: Colors.white,
        shadows: [Shadow(offset: Offset(1, 4), color: Colors.white12, blurRadius: 10)]),
    this.resultText = const TextStyle(
        fontFamily: 'Changa', fontSize: 56, height: 1, shadows: [Shadow(offset: Offset(1, 4), color: Colors.white12, blurRadius: 10)]),
    this.buttonsShape = NeumorphicShape.concave,
  });

  final Color backgroundColor;
  final TextStyle resultText;
  final TextStyle inputStyle;
  final NeumorphicShape buttonsShape;
  final NeumorphicStyle buttonStyle;
  final Color primaryColor;
  final TextStyle? textStyle;
  final Color? screenColor;
  final TextStyle buttonText;
  final int buttonsAnimSpeed;

  CalculatorTheme copyWith({
    Color? backgroundColor,
    TextStyle? resultText,
    TextStyle? inputStyle,
    NeumorphicShape? buttonsShape,
    NeumorphicStyle? buttonStyle,
    Color? primaryColor,
    TextStyle? textStyle,
    Color? screenColor,
    TextStyle? buttonText,
    int? buttonsAnimSpeed,
  }) {
    return CalculatorTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      resultText: resultText ?? this.resultText,
      inputStyle: inputStyle ?? this.inputStyle,
      buttonsShape: buttonsShape ?? this.buttonsShape,
      buttonStyle: buttonStyle ?? this.buttonStyle,
      primaryColor: primaryColor ?? this.primaryColor,
      textStyle: textStyle ?? this.textStyle,
      screenColor: screenColor ?? this.screenColor,
      buttonText: buttonText ?? this.buttonText,
      buttonsAnimSpeed: buttonsAnimSpeed ?? this.buttonsAnimSpeed,
    );
  }
}
