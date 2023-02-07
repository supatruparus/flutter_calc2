import 'package:arch_test/pages/calculator/data/providers/screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/calculator_repository.dart';
import 'package:arch_test/pages/calculator/data/repositories/calc_theme_repository_impl.dart';

class Expression extends StatelessWidget {
  const Expression({
    Key? key,
    this.flex = 1,
  }) : super(key: key);
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: SizedBox(
        height: 150,
        // color: Colors.red,
        child: Center(
          child: Consumer(builder: (context, ref, child) {
            final inputStyle = ref.watch(themeNotifierProvider.select((value) => value.inputStyle));
            return TextField(
              keyboardType: TextInputType.none,
              textAlign: TextAlign.end,
              textAlignVertical: TextAlignVertical.center,
              focusNode: ref.read(inputFocusProvider),
              mouseCursor: SystemMouseCursors.none,
              maxLines: 2,
              style: inputStyle.copyWith(
                color: Colors.white70,
                shadows: [
                  const Shadow(offset: Offset(-2, -2), color: Colors.white12, blurRadius: 10)
                ],
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              controller: ref.read(inputControllerProvider),
            );
          }),
        ),
      ),
    );
  }
}
