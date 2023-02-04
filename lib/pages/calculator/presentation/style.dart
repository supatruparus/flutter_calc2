import 'package:arch_test/pages/calculator/data/const.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _Style extends BoxDecoration {
  const _Style({super.gradient, this.padding = EdgeInsets.zero, this.textStyle});
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

const screenStyle = _Style(
    textStyle: TextStyle(),
    padding: EdgeInsets.only(right: 12),
    gradient: LinearGradient(
        colors: [MyColors.darkGrey, MyColors.screenTop],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter));
const backgroundColor = MyColors.darkGrey;

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, CalculatorTheme>((ref) {
  return ThemeNotifier();
});

class CalculatorTheme {
  CalculatorTheme({
    this.backgroundColor = MyColors.darkGrey,
    this.buttonStyle = const NeumorphicStyle(),
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
    this.buttonsShape = NeumorphicShape.concave,
  });

  final Color primaryColor;
  final TextStyle resultText;
  final TextStyle inputStyle;
  final NeumorphicShape buttonsShape;
  final NeumorphicStyle buttonStyle;
  final Color backgroundColor;

  CalculatorTheme copyWith({
    Color? primaryColor,
    TextStyle? resultText,
    TextStyle? inputStyle,
    NeumorphicStyle? buttonStyle,
  }) {
    return CalculatorTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      resultText: resultText ?? this.resultText,
      inputStyle: inputStyle ?? this.inputStyle,
      buttonStyle: buttonStyle ?? this.buttonStyle,
    );
  }
}

class ThemeNotifier extends StateNotifier<CalculatorTheme> {
  ThemeNotifier()
      : super(CalculatorTheme(
          buttonStyle: MyNeuStyles.defaultStyle,
        ));

  Color get primaryColor => state.primaryColor;

  set primaryColor(Color color) {
    state = state.copyWith(primaryColor: color);
    state = state.copyWith(buttonStyle: state.buttonStyle.copyWith(color: color));
  }

  set depth(double value) {
    state = state.copyWith(buttonStyle: state.buttonStyle.copyWith(depth: value));
  }

  double get depth => state.buttonStyle.depth ?? 0;

  setButtonShape(NeumorphicShape shape) {
    state = state.copyWith(buttonStyle: state.buttonStyle.copyWith(shape: shape));
  }

  changeButtonStyle(NeumorphicStyle style) {
    state = state.copyWith(buttonStyle: style);
  }
}

class CalcThemeRepository {
  static setPrimaryColor(WidgetRef ref, Color color) {
    ref.read(themeNotifierProvider.notifier).primaryColor = color;
  }

  static setButtonStyle(WidgetRef ref, NeumorphicStyle style) {
    ref.read(themeNotifierProvider.notifier).changeButtonStyle(style);
  }

  static setButtonsShape(WidgetRef ref, NeumorphicShape shape) {
    ref.read(themeNotifierProvider.notifier).setButtonShape(shape);
  }

  static setButtonDepth(WidgetRef ref, depth) {
    setButtonStyle(
        ref, ref.read(themeNotifierProvider.notifier).state.buttonStyle.copyWith(depth: depth));
  }
}

extension Styles on NeumorphicButton {
  concave() {
    return NeumorphicButton(
      style: const NeumorphicStyle(shape: NeumorphicShape.concave),
    );
  }

  flat() {
    return NeumorphicButton(
      style: const NeumorphicStyle(shape: NeumorphicShape.flat),
    );
  }

  circle() {
    return NeumorphicButton(
      style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
    );
  }
}
