import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
          child: Padding(
            padding: EdgeInsets.only(right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [Expression(), Result()],
            ),
          ),
        ));
  }


  Neumorphic screen_var1(Color primaryColor) {
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
  }

  Neumorphic screen_var2(Color primaryColor) {
    return Neumorphic(
      // decoration: screenStyle,
      style: NeumorphicStyle(color: primaryColor, depth: 5, intensity: 0.1, shape: NeumorphicShape.convex, surfaceIntensity: 1),
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(15
      ),

      textStyle: const TextStyle(fontSize: 10),

      child: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [Expression(), Result()],
        ),
      ),
    );
  }
}
