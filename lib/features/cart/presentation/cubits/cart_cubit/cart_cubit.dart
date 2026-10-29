import 'package:ecommerce_clean_architecture/features/cart/data/models/cart_model/cart_model.dart';
import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_entity/cart_entity.dart';
import 'package:ecommerce_clean_architecture/features/cart/domain/entities/cart_item_entity/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/entities/product_entity/product_entity.dart';
import 'package:ecommerce_clean_architecture/features/cart/presentation/cubits/cart_cubit/cart_states.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CartCubit extends HydratedCubit<CartStates> {
  CartCubit() : super(InitialCartState());

  final CartEntity cartEntity = CartEntity(items: []);

  void addProduct({required ProductEntity productEntity}) {
    CartItemEntity cartItem = cartEntity.getCartItem(
      productEntity: productEntity,
    );

    if (cartEntity.isExist(productEntity: productEntity)) {
      increaseCartItem(cartItemEntity: cartItem);
    } else {
      cartEntity.addCartItem(cartItem: cartItem);
      emit(CartUpdatedState(cartEntity: cartEntity, cartItemEntity: cartItem));
    }
  }

  void deleteCartItem({required CartItemEntity cartItemEntity}) {
    cartEntity.removeCartItem(cartItem: cartItemEntity);
    emit(CartUpdatedState(cartEntity: cartEntity));
  }

  void increaseCartItem({required CartItemEntity cartItemEntity}) {
    if (cartItemEntity.quantity < cartItemEntity.productEntity.unitAmount) {
      cartItemEntity.increaseCount();
      emit(
        CartUpdatedState(
          cartEntity: cartEntity,
          cartItemEntity: cartItemEntity,
        ),
      );
    }
  }

  void decreaseCartItem({required CartItemEntity cartItemEntity}) {
    if (cartItemEntity.quantity > 1) {
      cartItemEntity.decreaseCount();
      emit(
        CartUpdatedState(
          cartEntity: cartEntity,
          cartItemEntity: cartItemEntity,
        ),
      );
    }
  }

  @override
  CartStates? fromJson(Map<String, dynamic> json) {
    var loadedCart = CartModel.fromJson(json).toEntity();
    cartEntity.items.clear();
    cartEntity.items.addAll(loadedCart.items);
    return CartUpdatedState(cartEntity: cartEntity);
  }

  @override
  Map<String, dynamic>? toJson(CartStates state) {
    if (state is CartUpdatedState) {
      return CartModel.fromEntity(cartEntity: state.cartEntity).toMap();
    }
    return null;
  }
}
