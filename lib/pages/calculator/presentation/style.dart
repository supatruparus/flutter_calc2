import 'package:flutter_neumorphic/flutter_neumorphic.dart';

abstract class MyTextStyles {
  static const changaMedium = TextStyle(
    fontFamily: 'Changa',
    fontSize: 33,
    fontWeight: FontWeight.normal,
  );
}

extension Styles on NeumorphicButton {
  concave() {
    return NeumorphicButton(
      style: const NeumorphicStyle(shape: NeumorphicShape.concave),
    );
  }

  flat() {
    return NeumorphicButton(
      style: const NeumorphicStyle(shape: NeumorphicShape.flat),
    );
  }

  circle() {
    return NeumorphicButton(
      style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
    );
  }
}

// final buttonStyleProvider = StateProvider<NeumorphicStyle>((ref) {
//   final primaryColor = ref.watch(themeNotifierProvider.select((value) => value.primaryColor));
//
//   return NeumorphicStyle(
//     color: Color.lerp(primaryColor, Colors.white, 0.1),
//     intensity: 0.2,
//     surfaceIntensity: 10,
//     shadowLightColor: Color.lerp(primaryColor, Colors.white, 0.7),
//   );
// });
