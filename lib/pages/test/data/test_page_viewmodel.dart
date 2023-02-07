import 'package:arch_test/pages/test/data/storage/SharedPrefUserStorage.dart';
import 'package:arch_test/pages/test/data/storage/fake_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'repository/user_repository_impl.dart';
import '../domain/models/SaveUserNameParams.dart';
import '../domain/usecases/get_user_usecase.dart';
import '../domain/usecases/save_user_usecase.dart';

class TestPageViewModel {
  TestPageViewModel(
      {required this.getUserUseCase, required this.saveUserNameUseCase, required this.ref}) {
    showUser();
  }
  final ProviderRef ref;
  final GetUserUseCase getUserUseCase;
  final SaveUserNameUseCase saveUserNameUseCase;

  String get textField => ref.read(textFieldProvider);
  set textField(String text) {
    ref.read(textFieldProvider.notifier).update((state) => text);
  }

  onInputConfirm(String inputText) async {
    final splitText = inputText.split(' ');

    if (splitText.length == 2) {
      String first = splitText[0];
      String lastName = splitText[1];

      final param = SaveUserNameParams(firstName: first, lastName: lastName);

      SharedPrefUserStorage().save(param: param);
    } else {
      textField = 'введи два слова';
    }
  }

  showUser() async {
    final userName = await SharedPrefUserStorage().get();
    textField = 'userName: ${userName.firstName} ${userName.lastName}';
  }
}

final testPageViewModelProvider = Provider<TestPageViewModel>((ref) {
  return TestPageViewModel(
      ref: ref,
      saveUserNameUseCase: SaveUserNameUseCase(
          userRepository: UserRepositoryImpl(userStorage: SharedPrefUserStorage())),
      getUserUseCase: GetUserUseCase(
        userRepository: UserRepositoryImpl(userStorage: FakeStorage()),
      ));
});
