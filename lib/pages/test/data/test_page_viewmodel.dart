import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'repository/user_repository_impl.dart';
import '../domain/models/SaveUserNameParams.dart';
import '../domain/usecases/get_user_usecase.dart';
import '../domain/usecases/save_user_usecase.dart';

class TestPageViewModel {
  const TestPageViewModel(
      {required this.getUserUseCase, required this.saveUserNameUseCase, required this.ref});
  final ProviderRef ref;
  final GetUserUseCase getUserUseCase;
  final SaveUserNameUseCase saveUserNameUseCase;

  String get textField => ref.read(textFieldProvider);
  set textField(String text) {
    ref.read(textFieldProvider.notifier).update((state) => text);
  }

  saveUser(String text) {
    saveUserNameUseCase.execute(param: SaveUserNameParams(name: text));
  }

  showUser() async {
    final userName = await getUserUseCase.execute();
    textField = 'userName: ${userName.firstName} ${userName.lastname}';
  }
}

final testPageViewModelProvider = Provider<TestPageViewModel>((ref) {
  return TestPageViewModel(
      ref: ref,
      saveUserNameUseCase: const SaveUserNameUseCase(userRepository: UserRepositoryImpl()),
      getUserUseCase: GetUserUseCase(
        userRepository: const UserRepositoryImpl(),
      ));
});
