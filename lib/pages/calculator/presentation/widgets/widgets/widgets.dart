import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../data/const.dart';


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

get neoIcon {
  return NeumorphicButton(
    onPressed: () {},
    style: NeumorphicStyle(
      color: MyColors.darkGrey,
      intensity: 0.6,
      depth: 2,
      shape: NeumorphicShape.concave,
      boxShape: NeumorphicBoxShape.beveled(const BorderRadius.all(Radius.circular(10))),
      surfaceIntensity: 0.2,
    ),
    child: const Icon(
      Icons.add,
      size: 100,
    ),
  );
}
