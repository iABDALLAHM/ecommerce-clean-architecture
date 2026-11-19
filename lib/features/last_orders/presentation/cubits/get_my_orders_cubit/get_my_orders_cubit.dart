import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/repositories/order_repository/orders_repository.dart';
import 'package:ecommerce_clean_architecture/features/last_orders/presentation/cubits/get_my_orders_cubit/get_my_orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMyOrdersCubit extends Cubit<GetMyOrdersState> {
  GetMyOrdersCubit({
    required OrdersRepository ordersRepository,
    required SecureStorageRepository secureStorageRepository,
  }) : _ordersRepository = ordersRepository,
       _secureStorageRepository = secureStorageRepository,
       super(GetMyOrdersInitialState());

  final SecureStorageRepository _secureStorageRepository;
  final OrdersRepository _ordersRepository;

  Future getMyOrders() async {
    var userId = await _secureStorageRepository.getData(key: keyUserId);
    emit(GetMyOrdersLoadingState());
    var result = await _ordersRepository.getOrders(userId: userId);
    result.fold(
      (l) {
        emit(GetMyOrdersFailureState(errorMessage: l.message));
      },
      (s) {
        if (s.isEmpty) {
          emit(GetMyOrdersEmptyState());
        } else {
          emit(GetMyOrdersSuccessState(listOfOrders: s));
        }
      },
    );
  }
}
