import 'package:ecommerce_clean_architecture/features/checkout/domain/repositories/order_repository/orders_repository.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/payment_details_cubit/payment_state.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/entities/card_entity/card_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentDetailsCubit extends Cubit<PaymentState> {
  PaymentDetailsCubit({required OrdersRepository ordersRepository})
    : _ordersRepository = ordersRepository,
      super(InitialPaymentState());

  final OrdersRepository _ordersRepository;

  Future<void> savePaymentDetails({required CardEntity cardEntity}) async {
    emit(LoadingPaymentState());
    var result = await _ordersRepository.saveCardDetails(
      cardEntity: cardEntity,
    );

    result.fold(
      (failure) {
        emit(FailurePaymentState(errorMessage: failure.message));
      },
      (success) {
        emit(SuccessPaymentState());
      },
    );
  }

  Future<void> getPaymentDetails() async {}
}
