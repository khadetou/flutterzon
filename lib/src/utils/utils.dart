import 'package:shared_preferences/shared_preferences.dart';

Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  String token = pref.getString('x-auth-token')!;

  return token;
}
