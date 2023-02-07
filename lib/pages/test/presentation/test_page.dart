import 'package:arch_test/pages/test/data/repository/user_repository_impl.dart';
import 'package:arch_test/pages/test/data/test_page_viewmodel.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class TestPage extends ConsumerWidget {
  const TestPage({Key? key, required this.viewModel}) : super(key: key);
  final TestPageViewModel viewModel;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        backgroundColor: Colors.grey.shade500,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Column(
                  children: [
                    Consumer(builder: (context, ref, child) {
                      return Text(ref.watch(textFieldProvider));
                    }),
                    ElevatedButton(
                      onPressed: viewModel.showUser,
                      child: const Text("get user"),
                    ),
                    TextField(
                      onSubmitted: (editText) {
                        viewModel.onInputConfirm(editText);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
