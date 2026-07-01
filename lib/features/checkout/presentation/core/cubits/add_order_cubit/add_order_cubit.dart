import 'package:ecommerce_clean_architecture/features/checkout/domain/repositories/order_repository/orders_repository.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/order_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/add_order_cubit/add_order_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrderCubit extends Cubit<AddOrderStates> {
  AddOrderCubit({required this.orderRepo}) : super(InitialAddOrderState());

  final OrdersRepository orderRepo;

  Future<void> addOrder({required OrderEntity orderEntity}) async {
    emit(LoadingAddOrderState());
    var result = await orderRepo.addOrder(orderEntity: orderEntity);
    result.fold(
      (failure) => emit(FailureAddOrderState()),
      (success) => emit(SuccessAddOrderState()),
    );
  }
}
