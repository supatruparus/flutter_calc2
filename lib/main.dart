import 'dart:io';

import 'package:arch_test/pages/test/presentation/test_page.dart';
import 'package:arch_test/pages/test/data/test_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMaxSize(const Size(400, 800));
    setWindowMinSize(const Size(400, 800));
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 33)),
          colorScheme: const ColorScheme.dark()),
      home: Consumer(builder: (context, ref, child) {
        return TestPage(
          viewModel: ref.read(testPageViewModelProvider),
        );
      }),
    );
  }
}
