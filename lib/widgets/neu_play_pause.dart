import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeuPlayPauseBtn extends StatefulWidget {
  ///Create Animated Button Play -- Pause

  const NeuPlayPauseBtn({Key? key,this.onPlay, this.onPause,this.size, this.animDuration = 200}) : super(key: key);
  final int animDuration;
  final Function? onPlay;
  final Function? onPause;
  final double? size;

  @override
  State<NeuPlayPauseBtn> createState() => _NeuPlayPauseBtnState();

}

class _NeuPlayPauseBtnState extends State<NeuPlayPauseBtn>  with SingleTickerProviderStateMixin{
  late AnimationController animController;
  late Animation<double> animation;
  @override
  void initState() {
    animController = AnimationController(vsync: this,
        duration:  Duration(milliseconds: widget.animDuration)
    );

    animation = Tween<double>(begin: 0, end: 1).animate(animController);
    super.initState();

  }
  @override
  void dispose() {
    animController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _NeuVpukBtn.circle(

        onPressed: (){
          if(animController.value == 0){
            animController.forward();
            widget.onPlay?.call();
          }
          if(animController.value == 1){
            animController.reverse(from: animController.value);
            widget.onPause?.call();
          }
        },
        child: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: animation, size: widget.size,));
  }
}

class _NeuVpukBtn extends StatefulWidget {
  const _NeuVpukBtn.square(
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

  const _NeuVpukBtn.circle(
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
  State<_NeuVpukBtn> createState() => _NeuVpukBtnState();
}

class _NeuVpukBtnState extends State<_NeuVpukBtn> with SingleTickerProviderStateMixin {
  late final animController = AnimationController(vsync: this, duration: Duration(milliseconds: widget.animSpeed));
  late final pushAnim = Tween<double>(begin: 0, end:-10 ).animate(animController);
  late final Animation sizeAnim;
  bool isPressed = false;
  @override
  void initState() {
     sizeAnim = Tween<double>(begin: widget.size*0.9, end: widget.size*0.8).animate(animController);

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
        animController.forward(from: 0);

      },
      // onTapCancel: () => animController.animateBack(0),
      onTapUp: (details) {
        isPressed = false;
        if (animController.isCompleted) animController.animateBack(0);
      },
      child: SizedBox(
        width: widget.size,
        height: widget.size,
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
                  child: FittedBox(
                    child: widget.child ??
                         const SizedBox(
                          width: 30,
                          height: 30,
                        ),
                  ),
                );
              }
            ),
          ),

        ),
      ),
    );
  }
}

