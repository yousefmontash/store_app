import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:strore_app/helper/api.dart';

class GetAllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products/categories");
    return data;
  }
}
