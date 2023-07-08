import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  //store a string
  void setString({required String key, required String stringToStore}) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString(key, stringToStore);
  }

  //? retrieve stored string
  void getString() {}
}
