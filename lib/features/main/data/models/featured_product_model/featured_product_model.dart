import 'package:ecommerce_clean_architecture/features/main/domain/entities/featured_product_entity/featured_product_entity.dart';

class FeaturedProductModel {
  final String imageUrl;
  final String id;

  FeaturedProductModel({required this.imageUrl, required this.id});

  factory FeaturedProductModel.fromEntity({
    required FeaturedProductEntity productEntity,
  }) {
    return FeaturedProductModel(
      imageUrl: productEntity.image,
      id: productEntity.id,
    );
  }

  factory FeaturedProductModel.fromJson({required Map<String, dynamic> json}) {
    return FeaturedProductModel(imageUrl: json["imageUrl"], id: json["id"]);
  }

  FeaturedProductEntity toEntity() {
    return FeaturedProductEntity(image: imageUrl, id: id);
  }

  Map<String, dynamic> toMap() {
    return {"imageUrl": imageUrl, "id": id};
  }
}
