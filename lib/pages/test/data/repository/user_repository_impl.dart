import 'package:arch_test/pages/test/domain/models/SaveUserNameParams.dart';
import 'package:arch_test/pages/test/domain/repository/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl();
  final String SPKEY_FIRSTNAME = 'firstNameKEY';
  Future<SharedPreferences> loadSP() async {
    return await SharedPreferences.getInstance();
  }

  @override
  bool saveName({required SaveUserNameParams param}) {
    if (param.name.isNotEmpty) {
      loadSP().then((sp) {
        sp.setString(SPKEY_FIRSTNAME, param.name).then((value) => value == true
            ? print('firstNameSaved : ${param.name}')
            : print('Не удалось сохранить'));
      });
      return true;
    } else {
      throw FlutterError('name is empty');
    }
  }

  @override
  Future<UserName> getName() async {
    final sp = await SharedPreferences.getInstance();

    String? firstName = sp.getString(SPKEY_FIRSTNAME);
    if (firstName != null) {
      print('first name: $firstName');
      return UserName(firstName: firstName, lastname: 'Petrov');
    } else {
      throw FlutterError('Null firstName value');
    }
  }
}

final textFieldProvider = StateProvider<String>((ref) {
  return 'Ivan Ivanov';
});
