import 'package:arch_test/pages/calculator/presentation/settings_page/settings.dart';
import 'package:arch_test/pages/calculator/presentation/style.dart';

import 'package:flutter/material.dart';

import 'calc_page/calc_page.dart';

class _Calculator extends StatelessWidget {
  const _Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: PageView(
          children: const [calcPage(), settingsPage],
        ),
      ),
    );
  }
}

const calculator = _Calculator();
