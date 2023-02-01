import 'package:arch_test/pages/calculator/data/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}

class ColorSetting extends StatelessWidget {
  const ColorSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            MyStrings.color,
          )
        ],
      ),
    );
  }
}
