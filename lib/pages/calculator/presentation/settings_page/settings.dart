import 'package:arch_test/pages/calculator/data/const.dart';
import 'package:arch_test/pages/calculator/data/shared_preferences.dart';
import 'package:arch_test/pages/calculator/presentation/style.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _SettingsScreen extends ConsumerWidget {
  const _SettingsScreen({
    Key? key,
    required this.onChangeColor,
    required this.onChangeStyle,
    required this.onDepthChange,
  }) : super(key: key);
  final Function(Color color) onChangeColor;
  final Function(NeumorphicStyle) onChangeStyle;
  final Function(double value) onDepthChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final depthSlider = _DepthSlider(
      onChange: (percent) {
        onDepthChange(percent);
      },
    );
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ColorPicker(onColorChanged: (value) => onChangeColor(value)),
          _ButtonSetter(onChangStyle: (style) {
            onChangeStyle(style);
          }),
          const SizedBox(
            height: 30,
          ),
          depthSlider,
          NeumorphicButton(
            style: MyNeuStyles.defaultStyle,
            child: Text(
              'по умолчанию',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            onPressed: () {
              onChangeStyle(MyNeuStyles.defaultStyle);
            },
          )
        ],
      )),
    );
  }
}

class _DepthSlider extends ConsumerStatefulWidget {
  const _DepthSlider({Key? key, required this.onChange}) : super(key: key);

  final Function(double percent) onChange;

  @override
  ConsumerState<_DepthSlider> createState() => _DepthSliderState();
}

class _DepthSliderState extends ConsumerState<_DepthSlider> {
  double value = 10;
  @override
  Widget build(BuildContext context) {
    value = ref.watch(themeNotifierProvider).buttonStyle.depth ?? 0;
    return Column(
      children: [
        NeumorphicText(
          'depth:',
          textAlign: TextAlign.center,
          textStyle: NeumorphicTextStyle(fontSize: 30, letterSpacing: 10),
        ),
        Consumer(builder: (context, ref, child) {
          return Slider(
            activeColor:
                ref.watch(themeNotifierProvider.select((value) => value.buttonStyle.color)),
            onChanged: (percent) async {
              setState(() {
                value = percent;
                widget.onChange(percent);
              });
            },
            onChangeStart: (percent) {},
            onChangeEnd: (percent) {},
            min: 0,
            max: 20,
            value: value,
          );
        }),
      ],
    );
  }
}

class _ButtonSetter extends ConsumerStatefulWidget {
  const _ButtonSetter({Key? key, required this.onChangStyle}) : super(key: key);
  final Function(NeumorphicStyle style) onChangStyle;

  @override
  ConsumerState<_ButtonSetter> createState() => _ButtonSetterState();
}

class _ButtonSetterState extends ConsumerState<_ButtonSetter> {
  NeumorphicStyle style = const NeumorphicStyle();
  int index = -1;

  onSelect({required NeumorphicStyle selectedStyle}) {
    setState(() {
      style = selectedStyle;
    });
    widget.onChangStyle(style);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      style = ref.watch(themeNotifierProvider.select((value) => value.buttonStyle));
      final primaryColor = ref.watch(themeNotifierProvider.select((value) => value.primaryColor));
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonExample(
              onTap: () {
                setState(() {
                  index = 1;
                });
                onSelect(
                    selectedStyle: style.copyWith(
                        shape: NeumorphicShape.concave,
                        boxShape: const NeumorphicBoxShape.circle()));
              },
              isEnabled: index == 1,
              style: style.copyWith(
                  shape: NeumorphicShape.concave, boxShape: const NeumorphicBoxShape.circle())),
          buttonExample(
              style: style.copyWith(
                  shape: NeumorphicShape.convex, boxShape: const NeumorphicBoxShape.circle()),
              isEnabled: index == 2,
              onTap: () {
                setState(() {
                  index = 2;
                });
                onSelect(
                    selectedStyle: style.copyWith(
                        shape: NeumorphicShape.convex,
                        boxShape: const NeumorphicBoxShape.circle()));
              }),
          buttonExample(
            style: style.copyWith(
                boxShape: const NeumorphicBoxShape.circle(), shape: NeumorphicShape.flat),
            onTap: () {
              setState(() {
                index = 3;
              });
              onSelect(
                  selectedStyle: style.copyWith(
                      shape: NeumorphicShape.flat, boxShape: const NeumorphicBoxShape.circle()));
            },
            isEnabled: index == 3,
          ),
          buttonExample(
              style: style.copyWith(
                  boxShape: const NeumorphicBoxShape.rect(),
                  color: primaryColor,
                  shape: NeumorphicShape.flat),
              isEnabled: index == 4,
              onTap: () {
                index = 4;

                onSelect(
                    selectedStyle: style.copyWith(
                        shape: NeumorphicShape.flat, boxShape: const NeumorphicBoxShape.rect()));
              })
        ],
      );
    });
  }
}

const settingsPage = _SettingPage();

class _SettingPage extends ConsumerStatefulWidget {
  const _SettingPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => __SettingPageState();
}

class __SettingPageState extends ConsumerState<_SettingPage> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.read(themeNotifierProvider.notifier);
    return _SettingsScreen(
      onChangeColor: (color) {
        ref
            .read(themeNotifierProvider.notifier)
            .changeButtonStyle(ref.read(themeNotifierProvider).buttonStyle.copyWith(color: color));
        theme.primaryColor = color;
        MySharedPref.savePrimaryColor(color);
      },
      onChangeStyle: (style) {
        theme.changeButtonStyle(style);
        MySharedPref.saveBoxSape(style.boxShape ?? const NeumorphicBoxShape.circle());
      },
      onDepthChange: (value) {
        theme.depth = value;
        MySharedPref.saveButtonsDepth(value);
      },
    );
  }
}

Widget buttonExample(
    {double? size,
    required NeumorphicStyle style,
    String? text,
    required bool isEnabled,
    required Function() onTap}) {
  return Consumer(builder: (context, ref, child) {
    return NeumorphicButton(
      // isEnabled: isEnabled,
      padding: const EdgeInsets.all(4),
      style: style,

      onPressed: onTap,
      child: SizedBox(
        width: size ?? 60,
        height: size ?? 60,
        child: const Center(
          child: Icon(Icons.golf_course),
        ),
      ),
    );
  });
}
