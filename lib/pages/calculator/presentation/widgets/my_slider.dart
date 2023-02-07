

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/calc_theme_repository_impl.dart';


class StyledText extends Text {
  const StyledText(super.data, {super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Text(
          data ?? '',
          style: ref.watch(themeNotifierProvider.select((value) => value.textStyle)),
        );
      },
    );
  }
}
class SliderWithTitle extends StatefulWidget {
  const SliderWithTitle({
    super.key,
    this.title,
    required this.onChanged,
    this.startValue,
    this.min,
    this.max,
    this.onChangeEnd,
  });
  final String? title;
  final Function(double percent) onChanged;
  final double? startValue;
  final double? min;
  final double? max;
  final Function(double percent)? onChangeEnd;

  @override
  State<SliderWithTitle> createState() => _SliderWithTitleState();
}

class _SliderWithTitleState extends State<SliderWithTitle> {
  double value = 0;
  @override
  void initState() {
    value = widget.startValue ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title != null) StyledText(widget.title ?? ''),
        Slider(
            min: widget.min ?? 0,
            max: widget.max ?? 1,
            value: value,
            onChangeEnd: widget.onChangeEnd,
            onChanged: (percent) {
              setState(() {
                value = percent;
              });
              widget.onChanged(percent);
            }),
      ],
    );
  }
}