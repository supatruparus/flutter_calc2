import 'package:arch_test/pages/calculator/data/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final inputFocusProvider = Provider<FocusNode>((ref) {
  return FocusNode();
});

final resultSizeProvide = StateProvider<bool>((ref) {
  return false;
});

class ResultController {
  ResultController(this.ref);
  final WidgetRef ref;

  set(bool value) {
    ref.read(resultSizeProvide.notifier).update((state) => value);
  }

  get value => ref.read(resultSizeProvide);

  get watch => ref.read(resultProvider);

  set isActive(bool val) {
    isActive = val;
  }

  bool get isActive => ref.watch(resultSizeProvide);
}

class ProviderController {
  ProviderController({required this.ref, required this.provider});

  final WidgetRef ref;

  final StateProvider provider;

  get watch => ref.read(provider);
}
