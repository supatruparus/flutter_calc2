import 'dart:io';

import 'package:arch_test/pages/calculator/presentation/calc_page.dart';
import 'package:arch_test/pages/calculator/presentation/style.dart';
import 'package:arch_test/pages/home/home_page.dart';
import 'package:arch_test/pages/test/test_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_size/window_size.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS){
    setWindowMaxSize(const Size(450, 800));
    setWindowMinSize(const Size(350, 550));
  }

  runApp(


      const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData.dark(

      ).copyWith(

          textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 33)), backgroundColor: backgroundColor),
      home: const CalculatorPage(),
    );
  }
}

