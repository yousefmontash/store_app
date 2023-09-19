import 'dart:convert';
import 'dart:ffi';

import 'package:strore_app/models/rating_model.dart';

class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final RatingModel? rating;

  ProductModel({
    required this.id,
    required this.category,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.title,
  });

  factory ProductModel.fromJason(jsonData) {
    return ProductModel(
      id: jsonData["id"],
      category: jsonData["category"],
      description: jsonData["description"],
      image: jsonData["image"],
      price: jsonData["price"],
      rating: jsonData["rating"] == null
          ? null
          : RatingModel.fromJason(jsonData["rating"]),
      title: jsonData["title"],
    );
  }
}
