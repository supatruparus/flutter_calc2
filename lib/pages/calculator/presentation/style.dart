import 'package:arch_test/pages/calculator/data/const.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, CalculatorTheme>((ref) {
  return ThemeNotifier();
});

class CalculatorTheme {
  CalculatorTheme({
    this.buttonStyle = const NeumorphicStyle(
      lightSource: LightSource.topRight,
      shape: NeumorphicShape.convex,
      color: Colors.red,
      depth: 8,
      surfaceIntensity: 5,
      boxShape: NeumorphicBoxShape.circle(),
      intensity: 0.27,
    ),
    this.primaryColor = Colors.grey,
    this.inputStyle = const TextStyle(
        fontFamily: 'Changa',
        height: 1,
        fontSize: 48,
        color: Colors.white,
        shadows: [Shadow(offset: Offset(1, 4), color: Colors.white12, blurRadius: 10)]),
    this.resultText = const TextStyle(
        fontFamily: 'Changa',
        fontSize: 56,
        height: 1,
        shadows: [Shadow(offset: Offset(1, 4), color: Colors.white12, blurRadius: 10)]),
    this.buttonsShape = NeumorphicShape.convex,
  });
  final Color primaryColor;
  final TextStyle resultText;
  final TextStyle inputStyle;
  final NeumorphicShape buttonsShape;
  final NeumorphicStyle buttonStyle;

  CalculatorTheme copyWith({
    Color? primaryColor,
    TextStyle? resultText,
    TextStyle? inputStyle,
    NeumorphicShape? buttonsShape,
    NeumorphicStyle? buttonStyle,
  }) {
    return CalculatorTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      resultText: resultText ?? this.resultText,
      inputStyle: inputStyle ?? this.inputStyle,
      buttonsShape: buttonsShape ?? this.buttonsShape,
      buttonStyle: buttonStyle ?? this.buttonStyle,
    );
  }
}

class ThemeNotifier extends StateNotifier<CalculatorTheme> {
  ThemeNotifier() : super(CalculatorTheme());

  Color get primaryColor => state.primaryColor;

  set primaryColor(Color color) {
    state = state.copyWith(primaryColor: color);
    state = state.copyWith(buttonStyle: state.buttonStyle.copyWith(color: color));
  }

  setButtonShape(NeumorphicShape shape) {
    state = state.copyWith(buttonsShape: shape);
  }

  changeButtonStyle(NeumorphicStyle style) {
    state = state.copyWith(buttonStyle: style);
  }
}

class CalcThemeRepository {
  setPrimaryColor(WidgetRef ref, Color color) {
    ref.read(themeNotifierProvider.notifier).primaryColor = color;
  }

  setButtonStyle(WidgetRef ref, NeumorphicStyle style) {
    ref.read(themeNotifierProvider.notifier).changeButtonStyle(style);
  }
}
