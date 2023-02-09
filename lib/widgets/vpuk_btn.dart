import 'package:arch_test/pages/vpuk_button_test/theme.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension Brightness on Color {
  Color withWhite(double value) {
    ///add white to color value from 0 to 1
    return Color.lerp(this, Colors.white, value)!;
  }

  Color withBlack(double value) {
    ///add black to color value from 0 to 1
    return Color.lerp(this, Colors.black, value)!;
  }
}

class NeuButtonVar1 extends StatefulWidget {
  const NeuButtonVar1.square(
      {Key? key,
      this.boxShape = const NeumorphicBoxShape.rect(),
      this.animSpeed = 200,
      this.child,
      this.color = Colors.transparent,
      required this.onPressed,
      this.surfaceIntensity = 0.5})
      : super(key: key);

  const NeuButtonVar1.circle(
      {Key? key,
      this.surfaceIntensity = 0.5,
      this.boxShape = const NeumorphicBoxShape.circle(),
      this.animSpeed = 200,
      this.child,
      this.color = Colors.transparent,
      required this.onPressed})
      : super(key: key);
  final Function() onPressed;
  final Widget? child;
  final int animSpeed;
  final Color color;
  final double surfaceIntensity;
  final NeumorphicBoxShape boxShape;

  @override
  State<NeuButtonVar1> createState() => _NeuButtonVar1State();
}

class _NeuButtonVar1State extends State<NeuButtonVar1> with SingleTickerProviderStateMixin {
  late final animController = AnimationController(vsync: this, duration: Duration(milliseconds: widget.animSpeed));
  late final pushAnim = Tween<double>(begin: widget.surfaceIntensity, end: 0).animate(animController);
  bool isPressed = false;
  @override
  void initState() {
    animController.addStatusListener((status) {
      if (status == AnimationStatus.completed && isPressed == false) animController.animateBack(0);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final theme = ThemeRepository(ref: ref);
      return GestureDetector(
        onTapDown: (det) {
          isPressed = true;
          print('isPressed: $isPressed');
          animController.forward(from: 0);
          widget.onPressed();
        },
        // onTapCancel: () => animController.animateBack(0),
        onTapUp: (details) {
          isPressed = false;
          print('isPressed : $isPressed');
          if (animController.isCompleted) animController.animateBack(0);
        },
        child: AnimatedBuilder(
                    builder: (context, child) {
            return Stack(
              children: [
                Neumorphic(
                  style: NeumorphicStyle(
                      // depth: animController.value * -1,
                    depth: 0.5,
                      intensity: 0.3,
                      surfaceIntensity: pushAnim.value,
                      color: Colors.black.withOpacity(0.7),
                      shape: NeumorphicShape.convex,
                      boxShape: widget.boxShape),
                  drawSurfaceAboveChild: false,
                  child: widget.child ??
                      SizedBox(
                        width: 100,
                        height: 100,
                      ),
                ),
              ],
            );
          },
          animation: pushAnim,
        ),
      );
    });
  }
}




NeumorphicBorder _border_fromColor(Color color) {
  return NeumorphicBorder(
      color: color.withWhite(
        0.5,
      ),
      width: 2);
}
