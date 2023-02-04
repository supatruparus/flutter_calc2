import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeoTextGrey extends StatelessWidget {
  const NeoTextGrey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicText(
      '123',
      style: const NeumorphicStyle(
          intensity: 0.4,
          color: Color.fromRGBO(45, 45, 45, 1),
          depth: 1,
          // surfaceIntensity: 3,
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.circle()),
      textStyle: NeumorphicTextStyle(
          fontSize: 96, letterSpacing: 33, fontWeight: FontWeight.w800, wordSpacing: 3),
    );
  }
}
