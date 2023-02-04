import 'package:arch_test/pages/calculator/presentation/settings_page/settings.dart';
import 'package:arch_test/pages/calculator/presentation/style.dart';

import 'package:flutter/material.dart';

import 'keyboard/keyboard.dart';
import 'screen/screen.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: PageView(
          children: const [CalcPage(), settingsPage],
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
