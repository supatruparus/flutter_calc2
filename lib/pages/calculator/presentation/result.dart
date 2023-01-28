import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/result.dart';
import '../data/result_size.dart';
import 'style.dart' as styles;

class Result extends StatelessWidget {
  const Result({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: Consumer(builder: (context, ref, child) {
        final ResultController result = ResultController(ref);

        return AnimatedSize(
            curve: Curves.easeOutSine,
            duration: const Duration(milliseconds: 300),
            child: Text(
              ref.watch(resultProvider),
              style: result.isActive
                  ? styles.resultText.copyWith(
                      fontSize: ref.watch(resultSizeProvide),
                    )
                  : styles.resultText.copyWith(color: Colors.white24),
              textAlign: TextAlign.end,
            ));
      }),
    );
  }
}
