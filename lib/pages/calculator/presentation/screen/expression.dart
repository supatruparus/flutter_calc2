import 'package:arch_test/pages/calculator/data/input_controller_provider.dart';
import 'package:arch_test/pages/calculator/data/screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../style.dart';

class Expression extends ConsumerWidget {
  const Expression({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      height: 150,
      child: TextField(
        keyboardType: TextInputType.none,
        textAlign: TextAlign.end,
        textAlignVertical: TextAlignVertical.bottom,
        focusNode: ref.read(inputFocusProvider),
        mouseCursor: SystemMouseCursors.none,
        maxLines: 2,
        style: inputStyle,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        controller: ref.read(inputControllerProvider),
      ),
    );
  }
}
