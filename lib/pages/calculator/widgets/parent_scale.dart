import 'package:flutter/material.dart';

class ParentScale extends StatelessWidget {
  final double heightScale;

  const ParentScale({
    Key? key,
    this.widthScale = 1,
    this.heightScale = 1,
    this.child,
  }) : super(key: key);
  final double widthScale;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: constraints.maxWidth * widthScale,
          height: constraints.maxWidth * heightScale,
          child: Center(
            child: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: FittedBox(child: child),
            ),
          ),
        ),
      );
    });
  }
}
