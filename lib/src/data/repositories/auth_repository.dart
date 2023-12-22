import "dart:convert";
import "package:flutterzon/src/data/datasources/api/auth_api.dart";
import "package:flutterzon/src/data/models/user.dart";
import "package:http/http.dart" as http;

class AuthRepository {
  final AuthAPI authAPI = AuthAPI();

  Future<User> signUpUser(User inputUser) async {
    try {
      http.Response res = await authAPI.signUpUser(inputUser);
      if (res.statusCode == 200) {
        User user = User.fromMap(jsonDecode(res.body));
        return user;
      } else {
        throw jsonDecode(res.body)['msg'];
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<User> signInUser(String email, String password) async {
    try {
      final http.Response res = await authAPI.signInUser(email, password);

      if (res.statusCode == 200) {
        User user = User.fromMap(jsonDecode(res.body));
        return user;
      } else {
        throw jsonDecode(res.body)['msg'];
      }
    } catch (e) {
      throw e.toString();
    }
  }

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
