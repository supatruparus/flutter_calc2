import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:parent_scale/main.dart';

Icon get myIconClose {
  return const Icon(
    Icons.close,
    color: Colors.black,
  );
}

Widget get neuIcon {
  return SizedBox(
    width: 200,
    height: 200,
    child: NeumorphicButton(
      minDistance: 0,
      onPressed: () {},
      style: const NeumorphicStyle(
          border: NeumorphicBorder(isEnabled: true),
          shape: NeumorphicShape.concave,
          depth: 20,
          boxShape: NeumorphicBoxShape.circle()),
      child: ParentScale(widthScale: 0.7, heightScale: 0.7, child: myIconClose),
    ),
  );
}
