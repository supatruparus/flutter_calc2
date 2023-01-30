import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/result.dart';
import '../../data/screen_provider.dart';
import '../style.dart' as styles;

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

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutBack,
          width: double.infinity,
          height: !result.isActive ? 64 : 100,
          // color: Colors.grey,
          child: FittedBox(
            fit: BoxFit.contain,
            alignment: Alignment.centerRight,
            child: Text(
              ref.watch(resultProvider),
              maxLines: 1,
              style: result.isActive
                  ? styles.resultText
                  : styles.resultText.copyWith(color: Colors.white24),
              textAlign: TextAlign.end,
            ),
          ),
        );
      }),
    );
  }
}
