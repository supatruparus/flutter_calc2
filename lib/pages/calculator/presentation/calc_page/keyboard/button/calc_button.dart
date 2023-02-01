import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../../style.dart';

class CalculButton extends StatelessWidget {
  const CalculButton({
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
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: NeumorphicButton(
          drawSurfaceAboveChild: true,
          margin: const EdgeInsets.all(6),
          style: style,
          // margin: const EdgeInsets.all(5),
          onPressed: () {
            onPressed();
          },
          child: Center(
            child: FittedBox(
              child: child ??
                  Text(
                    value,
                    textAlign: TextAlign.center,
                    style: buttonsText,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
