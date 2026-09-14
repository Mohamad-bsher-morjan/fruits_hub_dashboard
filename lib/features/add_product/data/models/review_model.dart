import 'package:fruit_hub_dashboard/features/add_product/domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final num rating;
  final String date;
  final String reviewDiscription;

  new({
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.reviewDiscription,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      image: entity.image,
      rating: entity.rating,
      date: entity.date,
      reviewDiscription: entity.reviewDiscription,
    );
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      rating: json['rating'],
      date: json['date'],
      reviewDiscription: json['reviewDiscription'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'rating': rating,
      'date': date,
      'reviewDiscription': reviewDiscription,
    };
  }
}
