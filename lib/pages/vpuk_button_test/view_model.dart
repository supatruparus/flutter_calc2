
import 'dart:math';

import 'package:arch_test/pages/vpuk_button_test/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewModel{
  ViewModel({required this.theme, required this.ref});
  final WidgetRef ref;
  final ThemeRepository theme;

  changeBgColor(){
    final Color newColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    if(theme.bgColor != newColor){
      theme.changeBgColor(newColor);

    }else{
      changeBgColor();
    }
  }



}

