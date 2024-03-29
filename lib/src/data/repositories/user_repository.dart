import "dart:convert";
import 'package:flutterzon/src/data/datasources/api/user_apis.dart';
import 'package:flutterzon/src/data/models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final UserApi userApi = UserApi();

  Future<User> getUserDataInitial(var token) async {
    try {
      http.Response res = await userApi.getUserDataInitial(token);
      if (res.statusCode == 200) {
        User user = User.fromJson(
          jsonEncode(
            jsonDecode(res.body),
          ),
        );
        return user;
      } else {
        throw Exception(jsonDecode(res.body)['msg']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User> getUserData() async {
    try {
      http.Response res = await userApi.getUserData();
      if (res.statusCode == 200) {
        User user = User.fromJson(jsonEncode(res.body));
        return user;
      } else {
        throw Exception(jsonDecode(res.body)['msg']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User> saveUserAddress({required String address}) async {
    try {
      http.Response res = await userApi.saveUserAddress(address: address);
      if (res.statusCode == 200) {
        User user = User.fromJson(jsonEncode(jsonEncode(res.body)));
        return user;
      } else {
        throw Exception(jsonDecode(res.body)['msg']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
