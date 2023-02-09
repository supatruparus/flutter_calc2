import 'package:arch_test/pages/calculator/data/repositories/calc_theme_repository_impl.dart';
import 'package:arch_test/pages/vpuk_button_test/theme.dart';
import 'package:arch_test/pages/vpuk_button_test/view_model.dart';
import 'package:arch_test/widgets/vpuk_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VpukButtonTest extends ConsumerStatefulWidget {
  const VpukButtonTest({Key? key}) : super(key: key);

  @override
  ConsumerState<VpukButtonTest> createState() => _VpukButtonTestState();
}

class _VpukButtonTestState extends ConsumerState<VpukButtonTest> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      ThemeRepository theme = ThemeRepository(ref: ref);
      ViewModel viewModel = ViewModel(theme: theme, ref: ref);
      return Scaffold(
        body: Container(
          color: theme.bgColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: viewModel.changeBgColor,
                  child: const Text('change color'),
                ),
                SizedBox(height: 30,),
                NeuButtonVar1.circle(
                  animSpeed: 50,
                  color: theme.bgColor.withBlack(0.3),
                  onPressed: (){

                },
                child: Container(width: 100,height: 100,
                  padding: EdgeInsets.all(10),
                  
                  child: FittedBox(child: Text('1')),),),
              ],
            ),
          ),
        ),
      );
    });
  }
}

