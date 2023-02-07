import 'package:arch_test/pages/calculator/data/repositories/calc_theme_repository_impl.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        child: Center(
          child: content(),
        ));
  }

  Widget content() {
    return Consumer(builder: (context, ref, child) {
      final Color primaryColor = ref.watch(themeNotifierProvider.select((value) => value.backgroundColor));
      return Neumorphic(
        // decoration: screenStyle,
        style: NeumorphicStyle(color: Color.lerp(primaryColor, Colors.black, 0.7), depth: -10, intensity: 0.9),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(10),

        textStyle: const TextStyle(fontSize: 10),

        child: Padding(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [Expression(), Result()],
          ),
        ),
      );
    });
  }
}
