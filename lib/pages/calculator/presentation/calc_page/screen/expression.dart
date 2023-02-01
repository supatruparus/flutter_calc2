import 'package:arch_test/pages/calculator/data/input_controller_provider.dart';
import 'package:arch_test/pages/calculator/data/screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:arch_test/pages/calculator/presentation/style.dart';

class Expression extends ConsumerWidget {
  const Expression({
    Key? key,
    this.flex = 1,
  }) : super(key: key);
  final int flex;
  @override
  Widget build(BuildContext context, ref) {
    return Flexible(
      flex: flex,
      child: Container(
        height: 150,
        // color: Colors.red,
        child: Center(
          child: TextField(
            keyboardType: TextInputType.none,
            textAlign: TextAlign.end,
            textAlignVertical: TextAlignVertical.center,
            focusNode: ref.read(inputFocusProvider),
            mouseCursor: SystemMouseCursors.none,
            maxLines: 2,
            style: inputStyle,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            controller: ref.read(inputControllerProvider),
          ),
        ),
      ),
    );
  }
}
