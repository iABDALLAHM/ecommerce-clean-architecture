import 'package:ecommerce_clean_architecture/features/profile/domain/repositories/payment_repository/payment_repository.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/wallet/cubits/get_my_cards_cubit/get_my_cards_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetMyCardsCubit extends Cubit<GetMyCardsState> {
  GetMyCardsCubit({required PaymentRepository paymentRepository})
    : _paymentRepository = paymentRepository,
      super(InitialGetMyCardsState());

  final PaymentRepository _paymentRepository;

  Future getAllMyCards({required String uId}) async {
    emit(LoadingGetMyCardsState());
    var result = await _paymentRepository.getMyCards(uId: uId);

    result.fold(
      (failure) {
        emit(FailureGetMyCardsState(errorMessage: failure.message));
      },
      (result) {
        emit(SuccessGetMyCardsState(cardsList: result));
      },
    );
  }
}
