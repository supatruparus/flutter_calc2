import 'dart:ui';

import 'package:arch_test/pages/calculator/data/input_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'style.dart';

class Expression extends ConsumerWidget {
  const Expression({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      // color: Colors.green,
      child: TextField(

        keyboardType: TextInputType.none,
        textAlign: TextAlign.end,
        textAlignVertical: TextAlignVertical.top,
        focusNode: FocusNode(),
        mouseCursor: SystemMouseCursors.none,
        maxLines:2,
        clipBehavior: Clip.none,
        style: inputStyle,
        decoration: const InputDecoration(border: InputBorder.none,),
        controller: ref.read(inputControllerProvider),
      ),
    );

  }
}