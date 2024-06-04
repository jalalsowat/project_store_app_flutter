import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriesService {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categoryName}) async {
    http.Response response = await http.get(
        Uri.parse("https://fakestoreapi.com/products/category/$categoryName"));

    if (response.statusCode == 200) {
      List<ProductModel> productsList = [];
      List<dynamic> data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        productsList.add(ProductModel.fromJson(data[i]));
      }
      return productsList;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }
}
