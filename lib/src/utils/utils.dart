import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  String token = pref.getString('x-auth-token')!;

  return token;
}
