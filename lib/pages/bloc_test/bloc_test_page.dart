import 'package:arch_test/pages/bloc_test/counter_provider/counter_provider.dart';
import 'package:arch_test/pages/calculator/data/extensions/extensions.dart';
import 'package:arch_test/pages/calculator/data/key_bindings.dart';
import 'package:arch_test/pages/calculator/presentation/style.dart';
import 'package:arch_test/pages/calculator/presentation/widgets/widgets/calc_keyboard/CalcKeyboardV2.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';
import '../calculator/data/calculator_repository.dart';
import '../calculator/data/const.dart';
import '../calculator/data/providers/screen_provider.dart';
import '../calculator/data/result.dart';
import '../calculator/presentation/widgets/widgets/calc_keyboard/controller.dart';


class BlocTestPage extends StatelessWidget {
  const BlocTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child) {
          return MaterialApp(
              theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white10),
              home: Scaffold(
                body: SafeArea(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,

                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: NeumorphicText(ref
                              .watch(counterNotifierProvider)
                              .value
                              .toString(),
                            curve: Curves.bounceIn,
                            duration: const Duration(seconds: 3),
                            style: const NeumorphicStyle(intensity: 0.3),

                            textStyle: NeumorphicTextStyle(fontWeight: FontWeight.bold, fontSize: 120),),
                        ),
                        Flexible(
                          flex: 1,
                          child: Center(
                            child: Container(
                              width: double.infinity,
                              color: Colors.orange,
                              alignment: Alignment.center,
                              child: CalcKeyboardV2(
                                textStyle: MyTextStyles.changaMedium,
                                 contentColor: Colors.white, controller: KeyBindings(ref),

                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ));
        }
    );
  }
}

class KeyBindings implements CalcKeysBinding {
  KeyBindings(this.ref);
  final WidgetRef ref;

  String get result => ref.read(resultProvider);
  ResultController get resultSize => ResultController(ref);
  MyMathRepository get calculator => MyMathRepository(ref: ref);
  TextEditingController get inputController => ref.read(inputControllerProvider);
  FocusNode get inputFocus => ref.read(inputFocusProvider);

  @override
  void onClear() {
    _onTap();
    calculator.clearScreen();
  }

  @override
  void onRemove() async {
    _onTap();
    if(inputController.text.isNotEmpty){
      inputController.text = inputController.text.removeLast();
      if (inputController.text.containsSome(calcOperators) && !inputController.text.characters.last.isOperator) {
        calculator.showResult();
      } else {
        calculator.result = '';
      }
    }

  }

  @override
  void onDivide() {
    _onTap();
    inputSign('/');
  }

  @override
  void onMinus() async {
    _onTap();
    inputSign('-');
  }

  @override
  void onMultiply() async {
    Vibration.vibrate(duration: 50, amplitude: 20);
    inputFocus.unfocus();
    inputSign('×');
  }

  @override
  void onPlus() {
    _onTap();
    inputSign('+');
  }

  @override
  void onStepen() {
    _onTap();
    inputSign('^');
  }

  @override
  void onToggleSign() {}

  @override
  Future<void> insert(String string) async {
    _onTap();

    if (resultSize.isActive) {
      inputController.clear();
    }

    resultSize.set(false);
    ref.read(inputControllerProvider).text = ref.read(inputControllerProvider).text + string;

    if (inputController.text.containsSome(calcOperators)) {
      calculator.showResult();
    } else {
      ref.read(resultProvider.notifier).update((state) => '');
    }
  }

  @override
  void onEqual() async {
    _onTap();
    if (!inputController.text.characters.last.isOperator) {
      ///если последний символ не оператор
      if (inputController.text.containsSome(calcOperators)) {
        resultSize.set(true);
      }
    }
  }

  inputSign(String sign) {
    Vibration.vibrate(duration: 50, amplitude: 20);
    inputFocus.unfocus();
    if (inputController.text.isNotEmpty) {
      if (resultSize.isActive) {
        inputController.clear();
        inputController.text = result;
      }
      //
      if (inputController.text.characters.last.isOperator) {
        ///заменить знак
        inputController.text = inputController.text.replaceLast(sign);
      } else {
        ///добавить знак
        inputController.text = inputController.text + sign;
      }
      resultSize.set(false);
    }
  }

  _onTap() {
    Vibration.vibrate(duration: 50, amplitude: 20);
    inputFocus.unfocus();
  }
}
