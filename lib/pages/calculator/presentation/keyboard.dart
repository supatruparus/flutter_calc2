import 'package:arch_test/pages/calculator/presentation/style.dart';
import 'package:arch_test/pages/calculator/widgets/calc_keyboard/calc_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/key_bindings.dart';


class Keyboard extends StatelessWidget {
  const Keyboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) {
          return Calc_Keyboard(controller: KeyBindings(ref),buttonsSize: MediaQuery.of(context).size.width/5.5,buttonsStyle: circButton,);

        }
    );
  }
}