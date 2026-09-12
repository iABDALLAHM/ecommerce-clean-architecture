import 'package:ecommerce_clean_architecture/features/checkout/domain/repositories/checkout_payment_repository/checkout_payment_repository.dart';
import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/checkout_payment_cubit/checkout_payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutPaymentCubit extends Cubit<CheckoutPaymentState> {
  CheckoutPaymentCubit({
    required CheckoutPaymentRepository checkoutPaymentRepository,
  }) : _checkoutPaymentRepository = checkoutPaymentRepository,
       super(InitialCheckoutPaymentState());

  final CheckoutPaymentRepository _checkoutPaymentRepository;
  void pay({required String paymentMethod, required double amount}) async {
    emit(LoadingCheckoutPaymentState());

    var result = await _checkoutPaymentRepository.payWith(
      amount: amount,
      paymentMethod: paymentMethod,
      currency: "USD",
    );

    result.fold(
      (faliure) {
        emit(FailureCheckoutPaymentState(errorMessage: faliure.message));
      },
      (success) {
        emit(SuccessCheckoutPaymentState());
      },
    );
  }
}
