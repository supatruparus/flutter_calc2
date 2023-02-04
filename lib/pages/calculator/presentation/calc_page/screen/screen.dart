import 'package:arch_test/pages/calculator/data/const.dart';
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
          child: content(),
        ));
  }

  get neoIcon {
    return NeumorphicButton(
      onPressed: () {},
      child: Icon(
        Icons.add,
        size: 100,
      ),
      style: NeumorphicStyle(
        color: MyColors.darkGrey,
        intensity: 0.6,
        depth: 2,
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.beveled(BorderRadius.all(Radius.circular(10))),
        surfaceIntensity: 0.2,
      ),
    );
  }

  Neumorphic content() {
    return Neumorphic(
      // decoration: screenStyle,
      style: const NeumorphicStyle(color: MyColors.darkGrey__darker, depth: -10, intensity: 0.5),
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
}

Widget get neoText1 => Center(
      child: Builder(builder: (context) {
        return NeumorphicText(
          '123',
          style: const NeumorphicStyle(
              intensity: 0.4,
              color: MyColors.grey3lighter,
              depth: 1,
              // surfaceIntensity: 3,
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.circle()),
          textStyle: NeumorphicTextStyle(
              fontSize: 96, letterSpacing: 33, fontWeight: FontWeight.w800, wordSpacing: 3),
        );
      }),
    );
