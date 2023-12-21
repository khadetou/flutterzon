import "dart:convert";
import "package:flutterzon/src/data/datasources/api/auth_api.dart";
import "package:http/http.dart" as http;

class AuthRepository {
  final AuthAPI authAPI = AuthAPI();

  Future<bool> isTokenValid({required var token}) async {
    try {
      http.Response res = await AuthAPI().isTokenValid(token: token);
      if (res.statusCode == 200) {
        bool isTokenValid = jsonDecode(res.body);
        return isTokenValid;
      } else {
        throw jsonDecode(res.body)['msg'];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
