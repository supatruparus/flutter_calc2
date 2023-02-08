import 'dart:io';

import 'package:arch_test/pages/calculator/presentation/calculator.dart';
import 'package:arch_test/pages/test/data/repository/user_repository_impl.dart';
import 'package:arch_test/pages/test/data/storage/SharedPrefUserStorage.dart';
import 'package:arch_test/pages/test/data/test_page_viewmodel.dart';
import 'package:arch_test/pages/test/domain/usecases/get_user_usecase.dart';
import 'package:arch_test/pages/test/presentation/test_page.dart';
import 'package:arch_test/pages/vpuk_button_test/vpuk_btn_page.dart';
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
    return const MaterialApp(home: VpukButtonTest(),);
  }
}
