import 'package:arch_test/pages/calculator/data/input_controller_provider.dart';
import 'package:arch_test/pages/calculator/data/key_bindings.dart';
import 'package:arch_test/pages/calculator/data/screen_provider.dart';
import 'package:arch_test/pages/calculator/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/result.dart';

class Result extends StatelessWidget {
  const Result({
    super.key,
    this.flex = 1,
  });
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Consumer(builder: (context, ref, child) {
        final ResultController result = ResultController(ref);

        return Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
            width: double.infinity,
            height: !result.isActive ? 64 : 100,
            // color: Colors.grey,
            child: FittedBox(
              fit: BoxFit.contain,
              alignment: Alignment.centerRight,
              child: Text(
                ref.watch(resultProvider.select((value) => value.isNotEmpty ? '= $value' : '')),
                maxLines: 1,
                style: result.isActive
                    ? resultStyle.textStyle
                    : resultStyle.textStyle!.copyWith(color: Colors.white24),
                textAlign: TextAlign.end,
              ),
            ),
          ),
        );
      }),
    );
  }
}
