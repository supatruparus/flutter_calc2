import 'package:arch_test/pages/calculator/data/repositories/calc_theme_repository_impl.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    Key? key,
    this.value = '',
    this.size,
    this.style,
    this.animDuration = 100,
    required this.onPressed,
    // required this.button,
    this.child,
  }) : super(key: key);
  final String value;
  final int animDuration;
  final Function() onPressed;
  final Widget? child;
  final double fontSize = 32;
  final NeumorphicStyle? style;
  final double? size;
  // final Widget button;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      int animSpeed = ref.watch(themeNotifierProvider.select((value) => value.buttonsAnimSpeed));
      return NeumorphicButton(
        duration: Duration(milliseconds: animSpeed),
        drawSurfaceAboveChild: false,
        margin: const EdgeInsets.all(6),

        style: style,
        onPressed: () {
          onPressed();
        },
        child: Container(
          alignment: Alignment.center,
          // color: Colors.green,
          child: this.child ??
              _ButtonText(
                value,
              ),
        ),
      );
    });
  }
}

class _ButtonText extends StatelessWidget {
  const _ButtonText(
    this.data, {
    Key? key,
  }) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Text(
        data,
        textAlign: TextAlign.center,
        style: ref.watch(themeNotifierProvider.select((value) => value.buttonText))

    ));
  }
}
