import 'package:ecommerce_clean_architecture/core/entities/cart_entity.dart';
import 'package:ecommerce_clean_architecture/core/entities/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/core/entities/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_cubit/cart_states.dart';
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
      // emit state that tell the user the product is exist or increase a product count
      // cartItemEntity.increaseCount();
      emit(ProductExistState());
    } else {
      cartEntity.addCartItem(cartItem: cartItemEntity);
      emit(ProductAddedState());
    }
  }

  void deleteCartItem({required CartItemEntity cartItemEntity}) {
    cartEntity.removeCartItem(cartItem: cartItemEntity);
    emit(ProductRemovedState());
  }
}
