import 'package:flutter/foundation.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeuVpukV2 extends StatefulWidget {
  const NeuVpukV2.square(
      {Key? key,
        this.boxShape = const NeumorphicBoxShape.rect(),
        this.animSpeed = 200,
        this.child,
        this.color = Colors.transparent,
        required this.onPressed,
        this.lightColor,
        this.size = 70,
      })
      : super(key: key);

  const NeuVpukV2.circle(
      {Key? key,
        this.boxShape = const NeumorphicBoxShape.circle(),
        this.animSpeed = 200,
        this.child,
        this.color = Colors.transparent,
        required this.onPressed, this.lightColor, this.size =  70})
      : super(key: key);
  final Function() onPressed;
  final Widget? child;
  final int animSpeed;
  final Color color;
  final Color? lightColor;
  final double size;
  // final double surfaceIntensity;
  final NeumorphicBoxShape boxShape;

  @override
  State<NeuVpukV2> createState() => _NeuVpukV2State();
}

class _NeuVpukV2State extends State<NeuVpukV2> with SingleTickerProviderStateMixin {
  late final animController = AnimationController(vsync: this, duration: Duration(milliseconds: widget.animSpeed),);
  late final pushAnim = Tween<double>(begin: 0, end:-10 ).animate(animController);
  late final Animation sizeAnim;
  bool isPressed = false;
  @override
  void initState() {

    sizeAnim = Tween<double>(begin: widget.size*0.9, end: widget.size*0.8).animate(animController);

    animController.addStatusListener((status) {
      if (status == AnimationStatus.completed && !isPressed) animController.animateBack(0);
      if(status == AnimationStatus.dismissed && !isPressed) animController.animateBack(0);
      if(status == AnimationStatus.forward) {
        if (kDebugMode) {
          print('forward');
        }
      }
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (det) {
        widget.onPressed();
        isPressed = true;
        print('isPressed: $isPressed');
        animController.forward(from: 0);

      },
      // onTapCancel: () => animController.animateBack(0),
      onTapUp: (details) {
        isPressed = false;
        if (kDebugMode) {
          print('isPressed : $isPressed');
        }
        if (animController.isCompleted) animController.animateBack(0);
      },
      child: AnimatedBuilder(
        builder: (context, child) {
          return Stack(
            children: [
              Neumorphic(
                style: NeumorphicStyle(
                  // depth: animController.value * -1,
                    depth: pushAnim.value,
                    intensity: 1,

                    shadowLightColorEmboss: widget.lightColor ?? Colors.white.withOpacity(0.2),
                    surfaceIntensity: 0,
                    color: widget.color,
                    shape: NeumorphicShape.flat,
                    boxShape: widget.boxShape),
                drawSurfaceAboveChild: true,
                child: child,
              ),
            ],
          );
        },
        animation: pushAnim,
        child: Center(
          child: AnimatedBuilder(
              animation: sizeAnim,
              builder: (context, child) {

                return SizedBox(
                  height: sizeAnim.value,
                  width: sizeAnim.value,
                  child: widget.child ??
                      const SizedBox(
                        width: 30,
                        height: 30,
                      ),
                );
              }
          ),
        ),

      ),
    );
  }
}

