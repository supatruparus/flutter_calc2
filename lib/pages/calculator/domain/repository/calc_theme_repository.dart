import 'package:flutter_neumorphic/flutter_neumorphic.dart';

abstract class CalcThemeRepository {
  CalcThemeRepository();

  changePrimaryColor(Color primaryColor) {}
  Color get primaryColor;

  set buttonStyle(NeumorphicStyle style);

  NeumorphicStyle get buttonStyle;

  Color get backgroundColor;

  set backgroundColor(Color color);

  set screenColor(Color color);

  loadTheme() {}

  set buttonsAminSpeed(int milliseconds);
}
