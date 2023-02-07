import 'package:arch_test/pages/calculator/data/const.dart';
import 'package:flutter/material.dart';

enum ButtonBoxShape { circle, rect }

enum Shape { convex, concave, flat }

class ButtonParams {
  const ButtonParams(
      {this.boxShape = ButtonBoxShape.circle,
      this.color = MyColors.darkGrey__darker,
      this.shape = Shape.convex,
      this.depth = 10});
  final ButtonBoxShape? boxShape;
  final Color? color;
  final Shape? shape;
  final double? depth;
}
