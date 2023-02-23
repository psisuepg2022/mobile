// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/models/User/user_model.dart';

final authProvider = ChangeNotifierProvider((ref) {
  return Auth();
});

class Auth extends ChangeNotifier {
  UserModel? user;
  String? refreshToken;
  String? accessToken;

  Future<bool> getUserData() async {
    final pref = await SharedPreferences.getInstance();

    final userMap = pref.getString('PSIS:userData') ?? "";
    final storedRefreshToken = pref.getString('PSIS:refreshToken') ?? "";
    final storedAccessToken = pref.getString('PSIS:accessToken') ?? "";

    if (userMap != "") {
      final userJson = UserModel.fromJson(jsonDecode(userMap));

      refreshToken = storedRefreshToken;
      accessToken = storedAccessToken;
      user = userJson;

      notifyListeners();
      return true;
    }
    return false;
  }

  void setUser(
      UserModel? newUser, String refreshToken, String accessToken) async {
    if (newUser != null) {
      final pref = await SharedPreferences.getInstance();

      pref.setString("PSIS:userData", jsonEncode(newUser));
      pref.setString("PSIS:refreshToken", refreshToken);
      pref.setString("PSIS:accessToken", accessToken);

      user = newUser;
      refreshToken = refreshToken;
      accessToken = accessToken;

      notifyListeners();
    }
  }

  void clearUser() async {
    final pref = await SharedPreferences.getInstance();

    pref.clear();
    notifyListeners();
  }
}
