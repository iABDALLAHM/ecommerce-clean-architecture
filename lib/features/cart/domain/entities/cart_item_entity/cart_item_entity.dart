import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 1});

  num calculateTotalPrice() {
    return productEntity.productPrice * quantity;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * quantity;
  }

  int increaseCount() {
    return quantity++;
  }

  int decreaseCount() {
    return quantity--;
  }

  @override
  List<Object?> get props => [productEntity];
}
