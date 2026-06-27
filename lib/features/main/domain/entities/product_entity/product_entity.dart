import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String productName;
  final num productPrice;
  final String productCode;
  final String description;
  final String productImageUrl;
  final bool isOrganicProduct;
  final int expirationYears;
  final int numberOfCalories;
  final int unitAmount;

  const ProductEntity({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.description,
    required this.productImageUrl,
    required this.isOrganicProduct,
    required this.expirationYears,
    required this.numberOfCalories,
    required this.unitAmount,
  });
  
  @override
  List<Object?> get props => [productCode];
}
