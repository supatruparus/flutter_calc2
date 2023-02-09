import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeuVpukBtn extends StatefulWidget {
  const NeuVpukBtn.square(
      {Key? key,
        this.boxShape = const NeumorphicBoxShape.rect(),
        this.animSpeed = 200,
        this.child,
        this.color = Colors.transparent,
        required this.onPressed,
        this.lightColor,
        })
      : super(key: key);

  const NeuVpukBtn.circle(
      {Key? key,
        this.boxShape = const NeumorphicBoxShape.circle(),
        this.animSpeed = 200,
        this.child,
        this.color = Colors.transparent,
        required this.onPressed, this.lightColor})
      : super(key: key);
  final Function() onPressed;
  final Widget? child;
  final int animSpeed;
  final Color color;
  final Color? lightColor;
  // final double surfaceIntensity;
  final NeumorphicBoxShape boxShape;

  @override
  State<NeuVpukBtn> createState() => _NeuVpukBtnState();
}

class _NeuVpukBtnState extends State<NeuVpukBtn> with SingleTickerProviderStateMixin {
  late final animController = AnimationController(vsync: this, duration: Duration(milliseconds: widget.animSpeed));
  late final pushAnim = Tween<double>(begin: 0, end:-10 ).animate(animController);
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
                    depth: pushAnim.value,
                    intensity: 1,
                    shadowLightColorEmboss: widget.lightColor ?? Colors.white.withOpacity(0.2),
                    surfaceIntensity: 0,
                    color: widget.color,
                    shape: NeumorphicShape.flat,
                    boxShape: widget.boxShape),
                drawSurfaceAboveChild: false,
                child: widget.child ??
                    const SizedBox(
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
  }
}

