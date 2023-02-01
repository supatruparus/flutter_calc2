import 'package:arch_test/pages/calculator/presentation/style.dart';
import 'package:flutter/material.dart';
import 'expression.dart';
import 'result.dart';

class Screen extends StatelessWidget {
  final int flex;
  const Screen({Key? key, this.flex = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      flex: flex,
      child: Container(
        decoration: screenStyle,
        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [Expression(), Result()],
          ),
        ),
      ),
    );
  }
}
