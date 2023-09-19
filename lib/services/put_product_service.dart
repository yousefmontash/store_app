import 'package:strore_app/helper/api.dart';
import 'package:strore_app/models/product_model.dart';

class PutProductService {
  Future<ProductModel> putProduct(
      {required int id,
      required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> body = {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category
    };
    
    Map<String, dynamic> data = await Api().put(
      url: "https://fakestoreapi.com/products/$id",
      body: body,
    );
    return ProductModel.fromJason(data);
  }
}
