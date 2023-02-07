import 'package:arch_test/pages/test/domain/models/SaveUserNameParams.dart';
import 'package:arch_test/pages/test/domain/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/user_repository.dart';
import '../storage/storage.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({required this.userStorage});
  final UserStorage userStorage;
  @override
  saveName({required SaveUserNameParams param}) {
    userStorage.save(param: param);
  }

  @override
  Future<UserName> getName() async {
    final user = await userStorage.get();
    return UserName(firstName: user.firstName, lastname: user.lastName);
  }
}

final textFieldProvider = StateProvider<String>((ref) {
  return 'Ivan Ivanov';
});
