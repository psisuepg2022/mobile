import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/shared/models/User/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefs = FutureProvider<SharedPreferences>(
    (_) async => await SharedPreferences.getInstance());

class Auth extends StateNotifier<String> {
  Auth(this.pref) : super(pref?.getString("PSIS:UserData") ?? "");

  static final provider = StateNotifierProvider<Auth, String>((ref) {
    final pref = ref.watch(sharedPrefs).maybeWhen(
          data: (value) => value,
          orElse: () => null,
        );
    print(pref.toString());
    return Auth(pref);
  });

  final SharedPreferences? pref;

  void setUser(UserModel? newUser) {
    if (newUser != null) {
      state = newUser.toString();
      pref!.setString("PSIS:UserData", newUser.toString());
    }
    // Throw here since for some reason SharedPreferences could not be retrieved
    pref!.setString("PSIS:UserData", state);
  }
}
