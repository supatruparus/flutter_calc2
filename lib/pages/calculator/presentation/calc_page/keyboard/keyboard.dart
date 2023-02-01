import 'package:arch_test/pages/calculator/presentation/style.dart';
import 'package:arch_test/pages/calculator/widgets/calc_keyboard/calc_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/key_bindings.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({
    Key? key,
    this.flex = 1,
  }) : super(key: key);

  final int flex;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Consumer(builder: (context, ref, child) {
        final buttonStyle = ref.watch(themeNotifierProvider.select((value) => value.buttonStyle));
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CalcKeyboard(
            controller: KeyBindings(ref),
            // buttonsSize: MediaQuery.of(context).size.width / 2,
            buttonsStyle: buttonStyle,
          ),
        );
      }),
    );
  }
}
