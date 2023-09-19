import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:strore_app/helper/api.dart';
import 'package:strore_app/models/product_model.dart';

class GetProductsOfCategory {
  Future<List<ProductModel>> getProductsOfCategory(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(url: "https://fakestoreapi.com/products/category/$categoryName");

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJason(data[i]),
      );
    }
    return productsList;
  }
}
