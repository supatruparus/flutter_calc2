import 'package:arch_test/pages/calculator/data/const.dart';
import 'package:arch_test/pages/calculator/data/shared_preferences.dart';
import 'package:arch_test/pages/calculator/domain/usecases/get_theme_usecase.dart';
import 'package:arch_test/pages/calculator/presentation/settings_page/settings.dart';
import 'package:arch_test/pages/calculator/presentation/style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'calc_page/calc_page.dart';

class _Calculator extends ConsumerStatefulWidget {
  const _Calculator({Key? key}) : super(key: key);

  @override
  ConsumerState<_Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends ConsumerState<_Calculator> {
  final getThemeUseCase = GetThemeUseCase();

  loadColor() async {
    ref.read(themeNotifierProvider.notifier).primaryColor = await MySharedPref.getPrimaryColor();
  }

  loadBoxShape() async {
    NeumorphicBoxShape boxShape = await MySharedPref.getBoxShape();

    ref.read(themeNotifierProvider.notifier).changeButtonStyle(
        ref.read(themeNotifierProvider).buttonStyle.copyWith(boxShape: boxShape));
  }

  loadStyle() async {
    await loadColor();
    await loadBoxShape();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadStyle(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container(
                color: Colors.orange,
              );

            case ConnectionState.done:
              return Consumer(builder: (context, ref, child) {
                return MaterialApp(
                  theme: ThemeData.dark().copyWith(
                      textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 33)),
                      textSelectionTheme: TextSelectionThemeData(
                          selectionColor: ref
                              .watch(themeNotifierProvider.select((value) => value.primaryColor)),
                          cursorColor: ref
                              .watch(themeNotifierProvider.select((value) => value.primaryColor)),
                          selectionHandleColor: ref
                              .watch(themeNotifierProvider.select((value) => value.primaryColor))),
                      colorScheme: const ColorScheme.dark(background: MyColors.darkGrey)),
                  home: Scaffold(
                    backgroundColor:
                        ref.watch(themeNotifierProvider.select((value) => value.backgroundColor)),
                    body: SafeArea(
                      child: PageView(
                        children: const [CalcPage(), settingsPage],
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

const calculator = _Calculator();
