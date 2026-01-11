import 'package:ecommerce_clean_architecture/core/entities/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_item_cubit/cart_item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemCubit extends Cubit<CartItemStates> {
  CartItemCubit() : super(InitialCartItemState());
  void updateCartItem({required CartItemEntity cartItemEntity}) {
    emit(CartItemStateUpdated(cartItemEntity: cartItemEntity));
  }
}
