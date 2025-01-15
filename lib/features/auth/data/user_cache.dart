import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserCache {
  final SharedPreferences _preferences;

  UserCache(this._preferences);

  String? getUserData() {
    return _preferences.getString('user_data');
  }

  Future<void> saveUserData(String userData) async {
    await _preferences.setString('user_data', userData);
  }

  Future<void> clearUserData() async {
    await _preferences.remove('user_data');
  }
}
