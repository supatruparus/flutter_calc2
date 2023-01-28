import 'package:arch_test/pages/calculator/data/result_size.dart';
import 'package:arch_test/pages/calculator/data/shadow_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/result.dart';
import 'expression.dart';
import 'result.dart';
import 'style.dart' as styles;

class Screen extends StatelessWidget {
  final int flex;
  const Screen({Key? key, this.flex = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [Expression(), Result()],
      ),
    );
  }
}
