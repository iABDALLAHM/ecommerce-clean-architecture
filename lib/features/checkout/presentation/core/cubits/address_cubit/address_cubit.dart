import 'package:ecommerce_clean_architecture/features/checkout/domain/entities/shipping_address_entity/shipping_address_entity.dart';
import 'package:ecommerce_clean_architecture/features/checkout/domain/repositories/order_repository/orders_repository.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/address_cubit/address_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddressCubit extends Cubit<AddressState> {
  AddressCubit({required OrdersRepository ordersRepository})
    : _ordersRepository = ordersRepository,
      super(InitialAddressState());

  final OrdersRepository _ordersRepository;

  Future<void> saveAddress({
    required ShippingAddressEntity addressEntity,
  }) async {
    emit(LoadingSaveAddressState());
    var result = await _ordersRepository.saveAddress(
      addressEntity: addressEntity,
    );

    result.fold(
      (failure) {
        emit(FailureSaveAddressState(errorMessage: failure.message));
      },
      (success) {
        emit(SuccessSaveAddressState());
      },
    );
  }

  Future<void> getAddressForCurrentUser({required String userId}) async {
    emit(GetAddressesLoadingState());
    var result = await _ordersRepository.getAddress(userId: userId);

    result.fold(
      (failureState) {
        emit(GetAddressesFailureState(errorMessage: failureState.message));
      },
      (successState) {
        emit(GetAddressesSuccessState(addresses: successState));
      },
    );
  }
}
