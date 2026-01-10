import 'package:ecommerce_clean_architecture/core/entities/cart_entity.dart';
import 'package:ecommerce_clean_architecture/core/entities/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_cubit.dart/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(InitialCartState());
  CartEntity cartEntity = CartEntity(cartItems: []);
  void addProduct({required ProductEntity productEntity}) {
    bool isExist = cartEntity.isExist(productEntity: productEntity);
    CartItemEntity cartItemEntity = cartEntity.getCartItem(
      productEntity: productEntity,
    );
    if (isExist) {
      cartItemEntity.increaseCount();
      emit(ProductExistState());
    } else {
      cartEntity.addCartItem(cartItem: cartItemEntity);
      emit(ProductAddedState());
    }
  }
}
