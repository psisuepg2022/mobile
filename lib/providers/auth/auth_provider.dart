// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/models/User/user_model.dart';

final authProvider = ChangeNotifierProvider((ref) {
  return Auth();
});

class Auth extends ChangeNotifier {
  UserModel? user;

  // void getUserData() async {
  //   final pref = await SharedPreferences.getInstance();
  //   String userData = pref.getString("PSIS:userData") ?? "";

  //   Map<String, dynamic> userMap = jsonDecode(userData) as Map<String, dynamic>;
  //   user = UserModel.fromMap(userMap);
  //   print('USERDATA $userMap');
  // }

  void setUser(
      UserModel? newUser, String refreshToken, String accessToken) async {
    if (newUser != null) {
      final pref = await SharedPreferences.getInstance();
      print("AQUI DENTRO $pref");

      pref.setString("PSIS:userData", newUser.toString());
      pref.setString("PSIS:refreshToken", refreshToken);
      pref.setString("PSIS:accessToken", accessToken);

      user = newUser;

      notifyListeners();
    }
  }
}
