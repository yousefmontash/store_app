import 'dart:ffi';

class RatingModel {
  final dynamic rate;
  final dynamic count;

  RatingModel({
    required this.rate,
    required this.count,
  });
  
  factory RatingModel.fromJason(jasonData) {
    return RatingModel(
      rate: jasonData["rate"],
      count: jasonData["count"],
    );
  }
}
