
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final _themeProvider = StateProvider<_Theme>((ref) {
  return _Theme();
});


class ThemeRepository{
  const ThemeRepository({required this.ref});
  final WidgetRef ref;
  Color get bgColor => ref.watch(_themeProvider.select((value) => value.bgColor));


  changeBgColor(Color color ){
    ref.read(_themeProvider.notifier).update((state) => state.copyWith(bgColor: color));
  }

}

class _Theme{
  _Theme({this.bgColor = Colors.white, this.textStyle = const TextStyle()});
  final Color bgColor;
  final TextStyle textStyle;

  _Theme copyWith({
    Color? bgColor,
    TextStyle? textStyle,
  }) {
    return _Theme(
      bgColor: bgColor ?? this.bgColor,
      textStyle: textStyle ?? this.textStyle,
    );
  }
}