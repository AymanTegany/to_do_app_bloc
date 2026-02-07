import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_do_app_bloc/models/product_model.dart';

class ProductRepo {

  Future<List<ProductModel>> fetchProducts() async {
    final url = Uri.https('fakestoreapi.com', 'products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data
          .map((json) => ProductModel.fromMap(json))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
