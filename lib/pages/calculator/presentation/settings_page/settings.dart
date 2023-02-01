import 'package:arch_test/pages/calculator/data/const.dart';
import 'package:arch_test/pages/calculator/presentation/style.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _SettingsScreen extends ConsumerWidget {
  const _SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ColorPicker(
            onColorChanged: (value) =>
                ref.read(themeNotifierProvider.notifier).primaryColor = value,
          ),
          buttonSetter
        ],
      )),
    );
  }
}

const buttonSetter = _ButtonSetter();

class _ButtonSetter extends StatefulWidget {
  const _ButtonSetter({Key? key}) : super(key: key);

  @override
  State<_ButtonSetter> createState() => _ButtonSetterState();
}

class _ButtonSetterState extends State<_ButtonSetter> {
  NeumorphicShape shape = NeumorphicShape.convex;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final primaryColor = ref.watch(themeNotifierProvider.select((value) => value.primaryColor));
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonExample(
              color: primaryColor,
              shape: NeumorphicShape.concave,
              text: 'concave',
              onTap: () {
                setState(() {
                  shape = NeumorphicShape.concave;
                });
                ref.read(themeNotifierProvider.notifier).setButtonShape(shape);
              },
              isEnabled: shape == NeumorphicShape.concave),
          buttonExample(
              text: 'convex',
              onTap: () {
                setState(() {
                  shape = NeumorphicShape.convex;
                });
              },
              color: primaryColor,
              shape: NeumorphicShape.convex,
              isEnabled: shape == NeumorphicShape.convex),
          buttonExample(
              text: 'flat',
              onTap: () {
                setState(() {
                  shape = NeumorphicShape.flat;
                });
              },
              color: primaryColor,
              shape: NeumorphicShape.flat,
              isEnabled: shape == NeumorphicShape.flat),
        ],
      );
    });
  }

  Widget buttonExample(
      {required Color color,
      double? size,
      required NeumorphicShape shape,
      String? text,
      required bool isEnabled,
      required Function() onTap}) {
    return NeumorphicButton(
      // isEnabled: isEnabled,
      padding: const EdgeInsets.all(4),
      style: NeumorphicStyle(
        boxShape: const NeumorphicBoxShape.circle(),
        shape: shape,
        color: color,
        lightSource: LightSource.bottom,
        intensity: 0.3,
        surfaceIntensity: 20,
      ),

      onPressed: () {
        onTap();
        print(isEnabled);
      },
      child: SizedBox(
        width: size ?? 100,
        height: size ?? 100,
        child: Center(
          child: Text(
            text ?? '',
            style: const TextStyle(color: Colors.black54, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class ColorSetting extends StatelessWidget {
  const ColorSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          MyStrings.color,
        )
      ],
    );
  }
}

const settingsPage = _SettingsScreen();
