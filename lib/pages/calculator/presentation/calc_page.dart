import 'package:arch_test/pages/calculator/presentation/screen.dart';

import 'package:flutter/material.dart';

import 'keyboard.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: const [
            Screen(flex: 2,),
            Expanded(
                child: Keyboard())
          ],
        ),
      ),
    );
  }
}


