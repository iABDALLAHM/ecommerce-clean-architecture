import 'package:ecommerce_clean_architecture/constants.dart';
import 'package:ecommerce_clean_architecture/core/repositories/flutter_secure_storage_repository/secure_storage_repository.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/repositories/payment_repository/payment_repository.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/add_new_card/cubits/add_new_card_cubit/add_new_card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewCardCubit extends Cubit<AddNewCardState> {
  AddNewCardCubit({
    required PaymentRepository paymentRepository,
    required SecureStorageRepository secureStorageRepository,
  }) : _secureStorageRepository = secureStorageRepository,
       _paymentRepository = paymentRepository,

       super(InitialAddNewCardState());

  final PaymentRepository _paymentRepository;
  final SecureStorageRepository _secureStorageRepository;

  Future addCard({
    required String holderName,
    required String cardNumber,
    required String cardCVV,
    required String cardExpiredDate,
    required bool markAsDefault,
  }) async {
    emit(LoadingAddNewCardState());
    var userId = await _secureStorageRepository.getData(key: keyUserId);
    final CardEntity cardEntity = CardEntity(
      cardHolderName: holderName,
      cardNumber: cardNumber,
      cardCvv: cardCVV,
      cardExpiredDate: cardExpiredDate,
      markAsDefault: markAsDefault,
      cardImageType: kMasterCardIcon,
      cardHolderId: userId,
    );
    var result = await _paymentRepository.addNewCard(card: cardEntity);
    result.fold(
      (failure) => emit(FailureAddNewCardState(errorMessage: failure.message)),
      (result) {
        emit(SuccessAddNewCardState());
      },
    );
  }
}
