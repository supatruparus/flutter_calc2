import 'package:arch_test/pages/calculator/data/repositories/calc_theme_repository_impl.dart';
import 'package:arch_test/pages/calculator/presentation/style.dart';
import 'package:arch_test/pages/calculator/presentation/widgets/widgets/calc_keyboard/CalcKeyboardV2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/key_bindings.dart';
import '../../widgets/widgets/calc_keyboard/calc_keyboard.dart';

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
        final buttonStyleProvider = ref.watch(themeNotifierProvider.select((value) => value.buttonStyle));
        final textColor = ref.watch(themeNotifierProvider.select((value) => value.buttonText.color));
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CalcKeyboardV2(
            controller: KeyBindings(ref),
            buttonsStyle: buttonStyleProvider,
            contentColor: textColor ?? Colors.white54,
            textStyle: MyTextStyles.changaMedium,

          ),
        );
      }),
    );
  }
}
