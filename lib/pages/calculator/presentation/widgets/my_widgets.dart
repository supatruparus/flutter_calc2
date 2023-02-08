import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Widget buttonExample(
    {double? size,
    required NeumorphicStyle style,
    String? text,
    required bool isEnabled,
    required Function() onTap}) {
  return Consumer(builder: (context, ref, child) {
    return NeumorphicButton(
      padding: const EdgeInsets.all(4),
      style: style,
      onPressed: onTap,
      child: SizedBox(
        width: size ?? 60,
        height: size ?? 60,
      ),
    );
  });
}
