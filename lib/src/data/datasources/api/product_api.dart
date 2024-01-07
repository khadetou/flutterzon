import "package:flutterzon/src/utils/constants/strings.dart";
import "package:flutterzon/src/utils/utils.dart";

import "package:http/http.dart" as http;

class ProductsApi {
  final client = http.Client();

  Future<http.Response> searchProducts(String searchQuery) async {
    String token = await getToken();

    try {
      http.Response res = await client.get(
        Uri.parse('$uri/api/products/search/$searchQuery'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        },
      );
      return res;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<http.Response> getAvarageRatingLength({
    required String productId,
  }) async {
    String token = await getToken();

    try {
      http.Response res = await client.get(
        Uri.parse('$getAverageRatingLengthUri/$productId'),
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

  Future<http.Response> getDealOfTheDay() async {
    String token = await getToken();

    try {
      http.Response res = await client.get(
        Uri.parse((getDealOfTheDayUri)),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token
        },
      );
      return res;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
