import 'package:shared_preferences/shared_preferences.dart';

class AppSetting {
  // setUserId(String id) async {
  //   var pref = await SharedPreferences.getInstance();
  //   pref.setString('userId', id);
  // }

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

  saveUserProfile(String id, String name, String email) async {
    var pref = await SharedPreferences.getInstance();
    await pref.setString('userId', id);
    await pref.setString('name', name);
    await pref.setString('email', email);
  }

  Future<String> getUserName() async {
    var pref = await SharedPreferences.getInstance();
    return pref.getString('name') ?? '';
  }

  Future<String> getUserEmail() async {
    var pref = await SharedPreferences.getInstance();
    return pref.getString('email') ?? '';
  }
}
