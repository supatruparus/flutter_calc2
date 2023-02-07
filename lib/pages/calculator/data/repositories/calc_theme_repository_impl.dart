import 'package:arch_test/pages/calculator/data/storage/button_params_model.dart';
import 'package:arch_test/pages/calculator/data/storage/shared_preferences.dart';
import 'package:arch_test/pages/calculator/data/storage/storage_interface.dart';
import 'package:arch_test/pages/calculator/domain/models/calc_theme_model.dart';
import 'package:arch_test/pages/calculator/domain/repository/calc_theme_repository.dart';
import 'package:arch_test/pages/calculator/presentation/style.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension FromBrigtness on Color{
   Color fromBrigtness(){
    return computeLuminance() <= 0.5 ? Colors.white70 : Colors.black87;
  }
}

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, CalculatorTheme>((ref) {
  return ThemeNotifier(ref);
});

class ThemeNotifier extends StateNotifier<CalculatorTheme> implements CalcThemeRepository {
  ThemeNotifier(this.ref) : super(CalculatorTheme());

  StateNotifierProviderRef ref;
  @override
  NeumorphicStyle get buttonStyle => state.buttonStyle.copyWith(color: primaryColor);

  @override
  set buttonStyle(NeumorphicStyle style) {
    state = state.copyWith(buttonStyle: style);
  }

  ThemeStorage themeStorage = const SharedPrefThemeStorage();
  _getNeuShape(Shape shape) {
    switch (shape.index) {
      case 0:
        return NeumorphicShape.convex;
      case 1:
        return NeumorphicShape.concave;
      case 2:
        return NeumorphicShape.flat;
    }
  }


  TextStyle get buttonsText => MyTextStyles.changaMedium.copyWith(
        color: state.backgroundColor.computeLuminance() >= 0.5 ? Colors.white : Colors.black,
      );

  Color get watchBackgroundColor => ref.watch(themeNotifierProvider.select((value) => value.backgroundColor));

  @override
  Color get backgroundColor => state.backgroundColor;

  @override
  set backgroundColor(Color color) {
    state = state.copyWith(backgroundColor: color);
  }

  set depth(double value) {
    state = state.copyWith(buttonStyle: state.buttonStyle.copyWith(depth: value));
  }

  double get depth => state.buttonStyle.depth ?? 0;

  setButtonShape(NeumorphicShape shape) {
    state = state.copyWith(buttonStyle: state.buttonStyle.copyWith(shape: shape));
  }

  @override
  changePrimaryColor(Color color) {
    state = state.copyWith(
        textStyle: MyTextStyles.changaMedium.copyWith(color: color.fromBrigtness()),
        buttonText: MyTextStyles.changaMedium.copyWith(color:color.fromBrigtness()),
        primaryColor: color, backgroundColor: color, buttonStyle: state.buttonStyle.copyWith(color: color));
  }

  @override
  set screenColor(Color color) {
    state = state.copyWith(screenColor: color);
  }

  @override
  loadTheme() async {
    final params = await themeStorage.loadTheme();
    ('params: ${params.boxShape.toString()}');
    final color = params.primaryColor;
    NeumorphicShape shape = _getNeuShape(params.buttonShape);
    NeumorphicBoxShape boxShape = await SharedPrefThemeStorage.getBoxShape();
    state = state.copyWith(
      buttonsAnimSpeed: 100,
      buttonText: MyTextStyles.changaMedium,
      buttonStyle: state.buttonStyle.copyWith(
        boxShape: boxShape,
        shape: shape,
        color: color,
        intensity: 0.2,
        depth: 3,
      ),
      primaryColor: params.primaryColor,

      backgroundColor: Color.lerp(params.primaryColor, Colors.white, 0.04),
    );


  }


  @override
  Color get primaryColor => state.primaryColor;

  @override
  set buttonsAminSpeed(int milliseconds) {}
  int get buttonsAminSpeed => state.buttonsAnimSpeed;
}
