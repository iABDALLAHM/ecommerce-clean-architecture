import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/repositories/payment_repository/payment_repository.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/wallet/cubits/get_my_cards_cubit/get_my_cards_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetMyCardsCubit extends Cubit<GetMyCardsState> {
  GetMyCardsCubit({
    required PaymentRepository paymentRepository,
    required SecureStorageRepository secureStorageRepository,
  }) : _paymentRepository = paymentRepository,
       _secureStorageRepository = secureStorageRepository,
       super(InitialGetMyCardsState());

  final PaymentRepository _paymentRepository;
  final SecureStorageRepository _secureStorageRepository;

  Future getAllMyCards() async {
    var userId = await _secureStorageRepository.getData(key: keyUserId);
    emit(LoadingGetMyCardsState());
    var result = await _paymentRepository.getMyCards(uId: userId);

    result.fold(
      (failure) {
        emit(FailureGetMyCardsState(errorMessage: failure.message));
      },
      (result) {
        if (result.isEmpty) {
          emit(EmptyCardsState());
        } else {
          emit(SuccessGetMyCardsState(cardsList: result));
        }
      },
    );
  }
}
