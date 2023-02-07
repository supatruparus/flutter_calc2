import 'package:arch_test/pages/test/domain/models/SaveUserNameParams.dart';

import 'storage.dart';

class FakeStorage implements UserStorage {
  FakeStorage();
  User user = const User(firstName: 'Ivan', lastName: "Gamaz");

  @override
  Future<User> get() async {
    Future.delayed(const Duration(milliseconds: 1000));
    return user;
  }

  @override
  save({required SaveUserNameParams param}) async {
    user = User(firstName: param.firstName, lastName: param.lastName);
  }
}
