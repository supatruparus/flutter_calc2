import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class MyColorPicker extends StatefulWidget {
  const MyColorPicker({
    super.key,
    this.onChangeEnd,
    required this.startColor,
    this.onChange,
  });
  final Color startColor;
  final Function(Color newColor)? onChangeEnd;
  final Function(Color color)? onChange;

  @override
  State<MyColorPicker> createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  Color myNewColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ColorWheelPicker(
        onWheel: (value) async {
          // print('wheel: $value');
        },
        onChanged: (color) async {
          setState(() {
            myNewColor = color;
          });
          widget.onChange?.call(color);
        },
        onChangeEnd: (newColor) {
          widget.onChangeEnd?.call(myNewColor);
        },
        color: widget.startColor,
      ),
    );
  }
}
