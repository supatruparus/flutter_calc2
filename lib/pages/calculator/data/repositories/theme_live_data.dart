// import 'package:arch_test/pages/calculator/data/repositories/calc_theme_repository_impl.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// final _themelivedataProvider = Provider((ref) {
//
//
//   return CalcThemeLiveData(bgColor: ref.watch(themeNotifierProvider.select((value) => value.backgroundColor)), ref: ref,);
//
// });
//
//
// class CalcThemeLiveData {
//
//   CalcThemeLiveData({ required this.ref, required Color bgColor});
//
//   final Color _bgColor = Colors.black;
//   final ProviderRef ref;
//
//   Color readBgColor() => ref.read(themeNotifierProvider.select((value) => value.backgroundColor));
//   Color watchBgColor()=> ref.watch(themeNotifierProvider.select((value) => value.backgroundColor));
//
// }
