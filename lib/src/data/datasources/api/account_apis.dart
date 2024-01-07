import "dart:convert";
import 'package:flutterzon/src/utils/constants/strings.dart';
import 'package:flutterzon/src/utils/utils.dart';
import 'package:http/http.dart' as http;

class AccountApis {
  final client = http.Client();

  Future<http.Response> fetchMyOrders() async {
    final String token = await getToken();
    try {
      http.Response res = await client.get(
        Uri.parse(fetchMyOrdersUri),
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

  Future<http.Response> getAverageRating(String productId) async {
    final String token = await getToken();

    try {
      http.Response res = await client
          .get(Uri.parse('$getAverageRatingUri/$productId'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': token
      });

      return res;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
