import 'package:ecommerce_clean_architecture/features/checkout/domain/repositories/order_repository/orders_repository.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/save_payment_details_cubit/save_payment_state.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/entities/card_entity/card_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SavePaymentDetailsCubit extends Cubit<SavePaymentState> {
  SavePaymentDetailsCubit({required OrdersRepository ordersRepository})
    : _ordersRepository = ordersRepository,
      super(InitialSavePaymentState());

  final OrdersRepository _ordersRepository;

  Future<void> savePaymentDetails({required CardEntity cardEntity}) async {
    emit(LoadingSavePaymentState());
    var result = await _ordersRepository.saveCardDetails(
      cardEntity: cardEntity,
    );

    result.fold(
      (failure) {
        emit(FailureSavePaymentState(errorMessage: failure.message));
      },
      (success) {
        emit(SuccessSavePaymentState());
      },
    );
  }
}
