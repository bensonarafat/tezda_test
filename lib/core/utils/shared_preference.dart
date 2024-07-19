import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tezda_test/core/models/user.dart';

// For saving the user session of the logged in user

class UserSession {
  static const String keyUser = "user";
  static const String keyToken = "token";
  static late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future saveUser(TezdaUser user) async {
    await initPrefs();
    _prefs.setString(keyUser, jsonEncode(user.toLocalJson()));
  }

  Future<TezdaUser?> getUser() async {
    await initPrefs();
    var user = _prefs.getString(keyUser);
    if (user != null) {
      return TezdaUser.fromLocalJson(jsonDecode(user));
    }
    return null;
  }

  Future saveToken(String? firebaseToken) async {
    // firebase token used to send notifications
    await initPrefs();
    _prefs.setString(keyToken, firebaseToken ?? "");
  }

  Future<String?> token() async {
    await initPrefs();
    var token = _prefs.getString(keyToken);
    return (token?.isNotEmpty ?? false) ? token : null;
  }

  Future clear() async {
    await initPrefs();
    _prefs.remove(keyUser);
  }
}
