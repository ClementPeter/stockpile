import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  // final bool themeMode = true;

  //SharedPreferences pref = SharedPreferences();
  //store a string
  void setString({required String key, required String stringToStore}) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString(key, stringToStore);
  }

  //? retrieve stored string
  void getString({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final themeMode = preferences.getString(key) ?? true;
    // return themeMode;
    //themeMode = preferences.getInt(preferences);
  }
}
