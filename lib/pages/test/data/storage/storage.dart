import 'package:arch_test/pages/test/domain/models/SaveUserNameParams.dart';

class User {
  const User({this.firstName, this.lastName});
  final String? firstName;
  final String? lastName;
}

class UserStorage {
  void save({required SaveUserNameParams param}) {
    throw UnimplementedError();
  }

  Future<User> get() async {
    throw UnimplementedError();
  }
}
