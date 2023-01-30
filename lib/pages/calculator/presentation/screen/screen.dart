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
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [Expression(), Result()],
        ),
      ),
    );
  }
}
