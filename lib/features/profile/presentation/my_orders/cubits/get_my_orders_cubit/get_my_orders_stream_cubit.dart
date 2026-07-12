import 'dart:async';
import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.dart';
import 'package:ecommerce_clean_architecture/core/services/local_database_service/shared_prefs_service.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/repositories/order_repository/orders_repository.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/entities/my_order_entity/my_order_entity.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/cubits/get_my_orders_cubit/get_my_orders_stream_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetMyOrdersStreamCubit extends Cubit<GetMyOrdersState> {
  GetMyOrdersStreamCubit({required this.ordersRepository})
    : super(LoadingGetMyOrdersState()) {
    _streamSubscription = ordersRepository
        .getOrders(
          userId: getIt.get<SharedPrefService>().getData(key: "user-id"),
        )
        .listen((ordersList) {
          _monitorMyOrders(ordersList: ordersList);
        });
  }
  late StreamSubscription _streamSubscription;
  final OrdersRepository ordersRepository;

  void _monitorMyOrders({required List<MyOrderEntity> ordersList}) {
    if (ordersList.isNotEmpty) {
      emit(SuccessGetMyOrdersState(myOrders: ordersList));
    } else {
      emit(EmptyOrdersState());
    }
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
