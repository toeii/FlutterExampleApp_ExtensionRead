import 'package:shared_preferences/shared_preferences.dart';
/**
 * Created by toeii
 * Date: 2019-01-16
 */
///SharedPreferences
class LocalStorage {

  static save(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}