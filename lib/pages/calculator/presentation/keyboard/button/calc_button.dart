import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../../style.dart';

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
  final BoxDecoration? style;
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
          style: const NeumorphicStyle(
            lightSource: LightSource.topRight,
            shape: NeumorphicShape.concave,
            color: Colors.grey,
            depth: 8,
            surfaceIntensity: 5,
            // border: NeumorphicBorder(isEnabled: true, width: 0.7, color: Colors.white24),
            boxShape: NeumorphicBoxShape.circle(),
            intensity: 0.27,
          ),
          // margin: const EdgeInsets.all(5),
          onPressed: () {
            onPressed();
          },
          child: Center(
            child: Container(
              // width: 10,
              // height: 10,
              decoration: const BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: child ??
                  Text(
                    value,
                    style: buttonsText,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
