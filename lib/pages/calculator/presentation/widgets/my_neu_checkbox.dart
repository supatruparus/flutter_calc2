


import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyNeuCheckbox extends StatefulWidget {
  const MyNeuCheckbox({
    super.key,
    this.onChanged,
    this.isEnabled = true,
  });
  final Function(bool val)? onChanged;
  final bool isEnabled;

  @override
  State<MyNeuCheckbox> createState() => _MyNeuCheckboxState();
}

class _MyNeuCheckboxState extends State<MyNeuCheckbox> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return NeumorphicRadio(
      value: value,
      onChanged: (val) {
        setState(() {
          value = val ?? true;
        });
        widget.onChanged?.call(val ?? true);
      },
      isEnabled: widget.isEnabled,
      child: const Text('concave'),
    );
  }
}