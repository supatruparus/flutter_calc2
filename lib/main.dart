import 'dart:io';

import 'package:arch_test/pages/bloc_test/bloc_test_page.dart';
import 'package:arch_test/pages/calculator/presentation/calcv2.dart';
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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    return const MaterialApp(home: BlocTestPage(),);
  }
}
