

import 'package:arch_test/pages/vpuk_button_test/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension Brightness on Color{
  Color withWhite(double value){
    ///add white to color value from 0 to 1
    return Color.lerp(this, Colors.white, value)!
    ;
  }
  Color withBlack(double value){
    ///add black to color value from 0 to 1
    return Color.lerp(this, Colors.black, value)!;
  }
}




class VpukButton extends StatefulWidget {
  const VpukButton.square({Key? key,this.boxShape = const NeumorphicBoxShape.rect(), this.animSpeed = 200, this.child,this.color = Colors.transparent, required this.onPressed}) : super(key: key);

  const VpukButton.circle  ({Key? key,this.boxShape = const NeumorphicBoxShape.circle(), this.animSpeed = 200, this.child,this.color = Colors.transparent, required this.onPressed}) : super(key: key);
  final Function onPressed;
  final Widget? child;
  final int animSpeed;
  final Color color;
  final NeumorphicBoxShape boxShape;

  @override
  State<VpukButton> createState() => _VpukButtonState();
}

class _VpukButtonState extends State<VpukButton> with SingleTickerProviderStateMixin {
  late final animController = AnimationController(vsync: this, duration:  Duration(milliseconds: widget.animSpeed));
  late final pushAnim = Tween<double>(begin: 1, end:0.3).animate(animController);
  bool isPressed = false;
  @override
  void initState() {
    animController.addStatusListener((status) {
      if(status ==AnimationStatus.completed && isPressed == false) animController.animateBack(0);});

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Consumer(
      builder: (context, ref, child) {
        final theme = ThemeRepository(ref: ref);
        return GestureDetector(

          onTapDown: (det) {
            isPressed = true;
            print('isPressed: $isPressed');
            animController.forward(from: 0);
          },
          // onTapCancel: () => animController.animateBack(0),
          onTapUp: (details) {

            isPressed = false;
            print('isPressed : $isPressed');
            if(animController.isCompleted) animController.animateBack(0);
          },

          child: AnimatedBuilder(


            builder: (context,child ) {
              return Stack(
                children: [

                  Neumorphic(

                    style: NeumorphicStyle(
                        depth: animController.value*-20,
                        surfaceIntensity: pushAnim.value, color: widget.color, shape: NeumorphicShape.convex, boxShape: widget.boxShape),
                    drawSurfaceAboveChild: false,
                    child: widget.child,
                  ),
                ],
              );
            }, animation: pushAnim,
          ),
        );

      }
    );
  }

  NeumorphicRadio<Object> buildNeumorphicRadio(ThemeRepository theme) {
    return NeumorphicRadio(
        onChanged: (value){
          print('click');
        },curve: Curves.easeInBack,
        style: NeumorphicRadioStyle(
          selectedColor: theme.bgColor.withBlack(0.1),
          unselectedColor: theme.bgColor.withBlack(0.04),
          unselectedDepth: 0, selectedDepth: -20, boxShape: const NeumorphicBoxShape.circle(), intensity: 0.6 , /*shape: NeumorphicShape.concave*/),
        child: Container(width: 100,height: 100,child: const Text('1'),),
      );
  }
}

 NeumorphicBorder border_fromColor(Color color){
  return NeumorphicBorder(color: color.withWhite(0.5, ),width: 2);
   }

