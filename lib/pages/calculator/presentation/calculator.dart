import 'package:arch_test/pages/calculator/data/storage/shared_preferences.dart';
import 'package:arch_test/pages/calculator/presentation/settings_page/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/calc_theme_repository_impl.dart';
import 'calc_page/calc_page.dart';

class _Calculator extends ConsumerStatefulWidget {
  const _Calculator({Key? key}) : super(key: key);

  @override
  ConsumerState<_Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends ConsumerState<_Calculator> {
  late final theme = ref.read(themeNotifierProvider.notifier);
  @override
  Widget build(BuildContext context) {
    final storage = SharedPrefThemeStorage();
    return FutureBuilder(
        future: theme.loadTheme(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container();

            case ConnectionState.done:
              return MaterialApp(
                home: Scaffold(
                  backgroundColor: theme.backgroundColor,
                  body: SafeArea(
                    child: PageView(
                      children: const [CalcPage(), SettingsScreen()],
                    ),
                  ),
                ),
              );

            case ConnectionState.none:
              return Container(
                color: Colors.green,
              );

            case ConnectionState.active:
              return Center(child: Text(snapshot.connectionState.toString()));
          }
        });
  }
}

const calculator = _Calculator();
