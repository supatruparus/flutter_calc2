import 'package:flutter/material.dart';
import 'keyboard/keyboard.dart';
import 'screen/screen.dart';

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
