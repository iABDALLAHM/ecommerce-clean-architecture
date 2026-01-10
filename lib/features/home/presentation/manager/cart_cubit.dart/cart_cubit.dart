import 'package:ecommerce_clean_architecture/core/entities/cart_entity.dart';
import 'package:ecommerce_clean_architecture/core/entities/cart_item_entity.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/cart_cubit.dart/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(InitialCartState());
  CartEntity cartEntity = CartEntity(cartItems: []);
  void addCartItem({required CartItemEntity cartItem}) {
    cartEntity.addCartItem(cartItem: cartItem);
    emit(ProductAddedState());
  }
}
