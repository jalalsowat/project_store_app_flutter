import 'dart:convert';

import 'package:http/http.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    Response response =
        await Api().get(url: 'https://fakestoreapi.com/products');
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
