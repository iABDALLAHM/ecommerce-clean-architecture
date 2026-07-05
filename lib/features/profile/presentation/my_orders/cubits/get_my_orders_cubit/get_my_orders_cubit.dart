import 'package:ecommerce_clean_architecture/features/checkout/domain/repositories/order_repository/orders_repository.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/cubits/get_my_orders_cubit/get_my_orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetMyOrdersCubit extends Cubit<GetMyOrdersState> {
  GetMyOrdersCubit({required this.ordersRepository})
    : super(InitialGetMyOrdersState());

  final OrdersRepository ordersRepository;

  Future getAllOrders({required String userId}) async {
    emit(LoadingGetMyOrdersState());
    var result = await ordersRepository.getOrders(userId: userId);
    result.fold(
      (failure) {
        emit(FailureGetMyOrdersState(errorMessage: failure.message));
      },
      (listOfOrders) {
        if (listOfOrders.isEmpty) {
          emit(EmptyOrdersState());
        } else {
          emit(SuccessGetMyOrdersState(myOrders: listOfOrders));
        }
      },
    );
  }
}
