import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static SharedPreferences preferences;

  static Future<SharedPreferences> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<bool> putBool(String key, bool value) {
    return preferences.setBool(key, value);
  }
}
