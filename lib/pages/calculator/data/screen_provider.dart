import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final inputFocusProvider = Provider<FocusNode>((ref) {
  return FocusNode();
});

final resultSizeProvide = StateProvider<double>((ref) {
  return 48;
});

class ResultController {
  ResultController(this.ref);
  final WidgetRef ref;

  set(double value) {
    ref.read(resultSizeProvide.notifier).update((state) => value);
  }

  get value => ref.read(resultSizeProvide);

  get watch => ref.read(resultSizeProvide);

  bool get isActive => ref.watch(resultSizeProvide) == 96 ? true : false;
}
