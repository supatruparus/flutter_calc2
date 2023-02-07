import 'package:arch_test/pages/calculator/data/repositories/calc_theme_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension Styled on Text {
  static Consumer withConsumer(
    String data,
  ) {
    return Consumer(
      builder: (context, ref, child) {
        return Text(
          data,
          style: ref.watch(themeNotifierProvider.select((value) => value.textStyle)),
        );
      },
    );
  }
}
