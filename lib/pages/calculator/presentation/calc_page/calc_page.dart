import 'package:arch_test/pages/calculator/presentation/settings_page/settings.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'keyboard/keyboard.dart';
import 'screen/screen.dart';

class CalculatorApp extends ConsumerWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: const [CalcPage(), SettingsScreen()],
        ),
      ),
    );
  }
}

class CalcPage extends StatelessWidget {
  const CalcPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Screen(
          flex: 4,
        ),
        Keyboard(flex: 5),
      ],
    );
  }
}
