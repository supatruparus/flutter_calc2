import 'package:arch_test/pages/calculator/data/const.dart';
import 'package:arch_test/pages/calculator/data/storage/shared_preferences.dart';
import 'package:arch_test/pages/calculator/data/storage/storage_interface.dart';
import 'package:arch_test/pages/calculator/domain/repository/calc_theme_repository.dart';
import 'package:arch_test/pages/calculator/presentation/widgets/my_neu_checkbox.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/calc_theme_repository_impl.dart';
import '../widgets/my_widgets.dart';
import '../widgets/my_color_picker.dart';
import '../widgets/my_slider.dart';



class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeStorage storage = SharedPrefThemeStorage();
    final CalcThemeRepository calcThemeRepository = ref.read(themeNotifierProvider.notifier);
    final buttonStyle = ref.read(themeNotifierProvider.select((value) => value.buttonStyle));
    return SafeArea(
        child: ListView(
      children: [
        MyColorPicker(
          startColor: calcThemeRepository.primaryColor,
          onChange: (color) async{
            calcThemeRepository.changePrimaryColor(color);
          },
          onChangeEnd: (newColor) async {

            storage.saveTheme(CalcThemeParams(primaryColor: newColor));
          } ,
        ),
        _ButtonSetter(onClick: (style) {
          calcThemeRepository.buttonStyle = style;
          storage.saveTheme(CalcThemeParams( boxShape: style.boxShape, buttonShape: style.shape));

        }),
        const SizedBox(
          height: 30,
        ),
        SliderWithTitle(
          min: 0,
          max: 1,
          title: 'intensity',
          startValue: calcThemeRepository.buttonStyle.intensity,

          onChanged: (percent) {

            calcThemeRepository.buttonStyle = calcThemeRepository.buttonStyle.copyWith(intensity: percent);

          },
          onChangeEnd: (percent) {
            storage.saveTheme(CalcThemeParams(intencity: percent));
          },
        ),
        SliderWithTitle(
          min: -20,
          max: 20,
          startValue: calcThemeRepository.buttonStyle.depth,
          title: 'depth',
          onChanged: (percent) => calcThemeRepository.buttonStyle = calcThemeRepository.buttonStyle.copyWith(depth: percent),
          onChangeEnd: (percent) {
            storage.saveTheme(CalcThemeParams(buttonDepth: percent));
          },
        ),
        SliderWithTitle(
          title: 'surface intencity',
          startValue: buttonStyle.surfaceIntensity,
          onChanged: (percent) => calcThemeRepository.buttonStyle = calcThemeRepository.buttonStyle.copyWith(surfaceIntensity: percent),
          onChangeEnd: (percent) => storage.saveTheme(CalcThemeParams(surfaceIntencity: percent )),
        ),
        _DefaultButton(
          onChangeStyle: (style) {
            calcThemeRepository.buttonStyle = style;
            storage.saveTheme(CalcThemeParams(buttonShape: style.shape, boxShape: style.boxShape, primaryColor: style.color, intencity: style.intensity, buttonDepth: style.depth,surfaceIntencity: style.intensity));

          },
        ),
        Row(
          children: [
            MyNeuCheckbox(
              isEnabled: true,
              onChanged: (val) {
              },
            ),
            MyNeuCheckbox(
              isEnabled: true,
              onChanged: (val) {},
            )
          ],
        )
      ],
    ));
  }
}





class _DepthSlider extends StatefulWidget {
  const _DepthSlider({Key? key}) : super(key: key);

  @override
  State<_DepthSlider> createState() => _DepthSliderState();
}

class _DepthSliderState extends State<_DepthSlider> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _DefaultButton extends StatelessWidget {
  const _DefaultButton({
    required this.onChangeStyle,
  });

  final Function(NeumorphicStyle style) onChangeStyle;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: MyNeuStyles.defaultStyle,
      child: const StyledText(
        'по умолчанию',
      ),
      onPressed: () {
        onChangeStyle(MyNeuStyles.defaultStyle);
      },
    );
  }
}

class _ButtonSetter extends ConsumerStatefulWidget {
  const _ButtonSetter({Key? key, required this.onClick}) : super(key: key);
  final Function(NeumorphicStyle style) onClick;

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
    widget.onClick(style);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      style = ref.watch(themeNotifierProvider.select((value) => value.buttonStyle));
      final CalcThemeRepository themeRepository = ref.watch(themeNotifierProvider.notifier);
      final primaryColor = themeRepository.primaryColor;
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buttonExample(
              onTap: () {
                setState(() {
                  index = 1;
                });
                onSelect(
                    selectedStyle: style.copyWith(color: primaryColor, shape: NeumorphicShape.concave, boxShape: const NeumorphicBoxShape.circle()));
              },
              isEnabled: index == 1,
              style: style.copyWith(color: primaryColor, shape: NeumorphicShape.concave, boxShape: const NeumorphicBoxShape.circle())),
          buttonExample(
              style: themeRepository.buttonStyle.copyWith(shape: NeumorphicShape.convex, boxShape: const NeumorphicBoxShape.circle()),
              isEnabled: index == 2,
              onTap: () {
                setState(() {
                  index = 2;
                });
                onSelect(selectedStyle: style.copyWith(shape: NeumorphicShape.convex, boxShape: const NeumorphicBoxShape.circle()));
              }),
          buttonExample(
            style: style.copyWith(color: primaryColor, boxShape: const NeumorphicBoxShape.circle(), shape: NeumorphicShape.flat),
            onTap: () {
              setState(() {
                index = 3;
              });
              onSelect(selectedStyle: style.copyWith(shape: NeumorphicShape.flat, boxShape: const NeumorphicBoxShape.circle()));
            },
            isEnabled: index == 3,
          ),
          buttonExample(
              style: style.copyWith(boxShape: const NeumorphicBoxShape.rect(), color: primaryColor, shape: NeumorphicShape.flat),
              isEnabled: index == 4,
              onTap: () {
                index = 4;

                onSelect(selectedStyle: style.copyWith(shape: NeumorphicShape.flat, boxShape: const NeumorphicBoxShape.rect()));
              })
        ],
      );
    });
  }
}
