import "dart:convert";
import "package:flutterzon/src/utils/constants/strings.dart";
import "package:http/http.dart" as http;

class UserApi {
  final client = http.Client();

  Future<http.Response> getUserDataInitial(var token) async {
    try {
      http.Response res = await client.get(
        Uri.parse(getUserDataUri),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token,
        },
      );

      return res;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
