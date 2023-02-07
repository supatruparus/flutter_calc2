import 'package:arch_test/pages/calculator/presentation/settings_page/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/calc_theme_repository_impl.dart';
import 'calc_page/calc_page.dart';

class Calculator extends ConsumerStatefulWidget {
  const Calculator({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends ConsumerState<Calculator> {
  late final theme = ref.read(themeNotifierProvider.notifier);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: theme.loadTheme(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container();

            case ConnectionState.done:
              return Consumer(builder: (context, ref, child) {
                return MaterialApp(
                  theme:
                      ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: ref.watch(themeNotifierProvider.select((value) => value.primaryColor)))),
                  home: Scaffold(
                    backgroundColor: ref.watch(themeNotifierProvider.select((value) => value.backgroundColor)),
                    body: SafeArea(
                      child: PageView(
                        children: const [CalcPage(), SettingsScreen()],
                      ),
                    ),
                  ),
                );
              });

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
