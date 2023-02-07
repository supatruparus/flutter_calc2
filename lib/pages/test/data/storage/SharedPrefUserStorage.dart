// ignore_for_file: non_constant_identifier_names

import 'package:arch_test/pages/test/data/storage/storage.dart';
import 'package:arch_test/pages/test/domain/models/SaveUserNameParams.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUserStorage implements UserStorage {
  SharedPrefUserStorage();
  // ignore: non_constant_identifier_names
  final String SPKEY_FIRSTNAME = 'firstNameKEY';
  final String SPKEY_LASTNAME = 'lastNameKEY';

  Future<SharedPreferences> loadSP() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<User> get() async {
    final sp = await SharedPreferences.getInstance();

    String? firstName = sp.getString(SPKEY_FIRSTNAME);
    String? lastName = sp.getString(SPKEY_LASTNAME);
    if (firstName != null && lastName != null) {
      return User(firstName: firstName, lastName: lastName);
    } else {
      throw FlutterError('no firsname or lastname');
    }
  }

  @override
  void save({required SaveUserNameParams param}) async {
    // final sp = await SharedPreferences.getInstance();
    // bool firstNameSaved = await sp.setString(SPKEY_FIRSTNAME, param.firstName);
  }
}
