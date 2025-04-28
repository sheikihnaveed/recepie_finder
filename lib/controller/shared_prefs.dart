import 'package:shared_preferences/shared_preferences.dart';

// This helper remembers if we're logged in
class SharedPrefs {
  // Save login state (like writing in a diary)
  static Future<void> saveLoginState(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', isLoggedIn);
  }

  // Check login state (like reading the diary)
  static Future<bool> getLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}