import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 0});

  num calculateTotalPrice() {
    return productEntity.productPrice * count;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * count;
  }

  int increaseCount() {
    return count++;
  }

  int decreaseCount() {
    return count--;
  }

  @override
  List<Object?> get props => [productEntity];
}
