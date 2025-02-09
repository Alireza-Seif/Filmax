import 'package:shared_preferences/shared_preferences.dart';

class AppSetting {
  setUserId(String id) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString('userId', id);
  }

  Future<String> getUserId() async {
    var pref = await SharedPreferences.getInstance();
    String id = pref.getString('userId') ?? '';
    return id;
  }

  setUserLogged(bool loginStatus) async {
    var pref = await SharedPreferences.getInstance();
    pref.setBool('state', loginStatus);
  }

  Future<bool> isUserLogged() async {
    var pref = await SharedPreferences.getInstance();
    return pref.getBool('state') ?? false;
  }
}
