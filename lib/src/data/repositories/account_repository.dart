import "dart:convert";

import "package:flutterzon/src/data/datasources/api/account_apis.dart";
import "package:flutterzon/src/data/models/order.dart";
import 'package:http/http.dart' as http;

class AccountRepository {
  final AccountApis accountApis = AccountApis();

  Future<List<Order>> fetchMyOrders() async {
    try {
      List<Order> myOrderList = [];
      http.Response res = await accountApis.fetchMyOrders();

      if (res.statusCode == 200) {
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          myOrderList.add(
            Order.fromJson(
              jsonEncode(
                jsonDecode(res.body)[i],
              ),
            ),
          );
        }
        return myOrderList;
      } else {
        throw Exception(jsonDecode(res.body)['msg']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<double> getAverageRating(String productId) async {
    try {
      double averageRating = 0.0;
      http.Response res = await accountApis.getAverageRating(productId);

      if (res.statusCode == 200) {
        averageRating = jsonDecode(res.body).toDouble();
        return averageRating;
      } else {
        throw Exception(jsonDecode(res.body)['error']);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
