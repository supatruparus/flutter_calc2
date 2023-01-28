import 'package:flutter/material.dart';

import '../../../presentation/style.dart';

class AnimButton extends StatefulWidget {
  const AnimButton({Key? key, this.animDuration = 100, this.child,this.style = const  BoxDecoration(
      color: Colors.grey,
      gradient:  LinearGradient(colors: [Color.fromRGBO(123, 123, 123, 1), Color.fromRGBO(170, 170, 170, 1)]),
      boxShadow: [BoxShadow(color:Colors.black12 )],
      borderRadius: BorderRadius.all(Radius.circular(50))), this.onTap}) : super(key: key);
  final Widget? child;
  final Function()? onTap;
  final int animDuration;
  final BoxDecoration? style;

  @override
  State<AnimButton> createState() => _AnimButtonState();
}

class _AnimButtonState extends State<AnimButton> with SingleTickerProviderStateMixin {
  late final animController =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
  late final Animation<double> animation;
  double _scale = 1;
  onTap() {
    setState(() {
      _scale = 0.9;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onTap();
          widget.onTap?.call();
        },
        child: AnimatedScale(
            duration: Duration(milliseconds: widget.animDuration),
            curve: Curves.easeInQuad,
            scale: _scale,
            onEnd: () {
              setState(() {
                _scale = 1;
              });
            },
            child: AnimatedBuilder(
                animation: Tween<double>(begin: -8, end: 8).animate(animController),
                builder: (context, child) {
                  return Container(decoration: widget.style, child: widget.child);
                })));
  }
}
