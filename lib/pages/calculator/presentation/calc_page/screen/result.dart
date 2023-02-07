import 'package:arch_test/pages/calculator/data/providers/screen_provider.dart';
import 'package:arch_test/pages/calculator/data/repositories/calc_theme_repository_impl.dart';
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
      child: _animResult,
    );
  }

  Consumer get _animResult {
    return Consumer(builder: (context, ref, child) {
      final ResultController result = ResultController(ref);
      final resultStyle = ref.watch(themeNotifierProvider.select((value) => value.resultText));
      final primaryColor = ref.watch(themeNotifierProvider.select((value) => value.backgroundColor));
      final activeColor = Color.lerp(Colors.white, primaryColor, 0.6);
      final String resultText = ref.watch(resultProvider);
      final resultLength = resultText.length;

      return Center(
        child: SizedBox(
          // duration: const Duration(milliseconds: 300),
          // curve: Curves.easeIn,
          width: double.infinity,
          child: Text(
            ref.watch(resultProvider.select((value) => value.isNotEmpty ? '=$value' : '')),
            maxLines: 1,
            style: (result.isActive)
                ? resultStyle.copyWith(
                    color: activeColor,
                    overflow: TextOverflow.visible,
                    fontSize:  resultLength<=5 ? 96 : 64,
                    shadows: [Shadow(offset: const Offset(1, 4), color: activeColor?.withOpacity(0.3) ?? Colors.white12, blurRadius: 10)],
                  )
                : resultStyle.copyWith(color: Colors.white12),
            textAlign: TextAlign.end,
          ),
        ),
      );
    });
  }
}
