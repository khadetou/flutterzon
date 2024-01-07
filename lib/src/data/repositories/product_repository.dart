import 'dart:convert';

import 'package:flutterzon/src/data/datasources/api/product_api.dart';
import 'package:flutterzon/src/data/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsRepository {
  final ProductsApi productsApi = ProductsApi();

  Future<List<Product>> searchProducts(String searchQuery) async {
    List<Product> productList = [];

    try {
      http.Response res = await productsApi.searchProducts(searchQuery);

      if (res.statusCode == 200) {
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          productList.add(
            Product.fromJson(
              jsonEncode(
                jsonDecode(res.body)[i],
              ),
            ),
          );
        }
        return productList;
      } else {
        throw Exception(jsonDecode(res.body)['msg']);
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
