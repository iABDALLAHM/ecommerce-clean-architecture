import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_entity/cart_entity.dart';
import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_item_entity/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(InitialCartState());

  final CartEntity cartEntity = CartEntity(items: []);

  void addProduct({required ProductEntity productEntity}) {
    CartItemEntity cartItem = cartEntity.getCartItem(
      productEntity: productEntity,
    );

    emit(LoadingAddProductState(cartItemEntity: cartItem));

    if (cartEntity.isExist(productEntity: productEntity)) {
      increaseCartItem(cartItemEntity: cartItem);
    } else {
      cartEntity.addCartItem(cartItem: cartItem);
      emit(ProductAddedState(cartItemEntity: cartItem));
    }
  }

  void deleteCartItem({required CartItemEntity cartItemEntity}) {
    cartEntity.removeCartItem(cartItem: cartItemEntity);
    emit(ProductRemovedState());
  }

  void increaseCartItem({required CartItemEntity cartItemEntity}) {
    if (cartItemEntity.quantity < cartItemEntity.productEntity.unitAmount) {
      cartItemEntity.increaseCount();
      emit(ProductIncreaseState(cartItemEntity: cartItemEntity));
    }
  }

  void decreaseCartItem({required CartItemEntity cartItemEntity}) {
    if (cartItemEntity.quantity > 1) {
      cartItemEntity.decreaseCount();
      emit(ProductDecreaseState(cartItemEntity: cartItemEntity));
    }
  }
}
