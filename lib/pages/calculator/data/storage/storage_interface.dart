import 'package:arch_test/pages/calculator/data/storage/button_params_model.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CalcThemeParams {
  const CalcThemeParams({this.primaryColor, this.backgroundColor, this.boxShape, this.buttonDepth, this.intencity, this.buttonShape = Shape.convex, this.surfaceIntencity,});
  final Color? primaryColor;
  final Color? backgroundColor;
  final NeumorphicBoxShape? boxShape;
  final dynamic buttonShape;
  final double? intencity;
  final double? buttonDepth;
  final double? surfaceIntencity;
}

abstract class ThemeStorage {
  ThemeStorage();
  Future<bool> saveTheme(CalcThemeParams params);

  Future<CalcThemeParams> loadTheme();
}
