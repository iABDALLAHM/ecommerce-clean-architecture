import 'package:ecommerce_clean_architecture/core/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String rating;
  final String date;
  final String reviewDescription;

  ReviewModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.reviewDescription,
  });
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json["name"],
      image: json["image"],
      rating: json["rating"],
      date: json["date"],
      reviewDescription: json["reviewDescription"],
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      rating: rating,
      date: date,
      reviewDescription: reviewDescription,
    );
  }

  factory ReviewModel.fromEntity({required ReviewEntity reviewEntity}) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      rating: reviewEntity.rating,
      date: reviewEntity.date,
      reviewDescription: reviewEntity.reviewDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "image": image,
      "rating": rating,
      "date": date,
      "reviewDescription": reviewDescription,
    };
  }
}
