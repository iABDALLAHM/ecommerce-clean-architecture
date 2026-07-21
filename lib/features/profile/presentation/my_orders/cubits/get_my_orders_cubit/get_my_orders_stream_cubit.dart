import 'dart:async';
import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_clean_architecture/features/checkout/checkout.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/repositories/order_repository/orders_repository.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/my_orders/cubits/get_my_orders_cubit/get_my_orders_stream_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetMyOrdersStreamCubit extends Cubit<GetMyOrdersState> {
  GetMyOrdersStreamCubit({
    required this.ordersRepository,
    required SecureStorageRepository secureStorageRepository,
  }) : _secureStorageRepository = secureStorageRepository,
       super(LoadingGetMyOrdersState()) {
    listeningLoadOrders();
  }

  void listeningLoadOrders() async {
    var userId = await _secureStorageRepository.getData(key: keyUserId);
    _streamSubscription = ordersRepository.getOrders(userId: userId).listen((
      ordersList,
    ) {
      _monitorMyOrders(ordersList: ordersList);
    });
  }

  final SecureStorageRepository _secureStorageRepository;
  late StreamSubscription _streamSubscription;
  final OrdersRepository ordersRepository;

  void _monitorMyOrders({required List<OrderEntity> ordersList}) {
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
