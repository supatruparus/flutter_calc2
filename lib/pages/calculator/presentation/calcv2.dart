import 'package:arch_test/pages/calculator/presentation/settings_page/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/repositories/calc_theme_repository_impl.dart';
import 'calc_page/calc_page.dart';

class CalculatorV2 extends ConsumerStatefulWidget {
  const CalculatorV2({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CalculatorV2> createState() => _CalculatorState();
}

class _CalculatorState extends ConsumerState<CalculatorV2> {
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
                  ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.black45),scaffoldBackgroundColor: Colors.white10),
                  home: Scaffold(
                    body: SafeArea(
                      child: CalcPage(),
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
