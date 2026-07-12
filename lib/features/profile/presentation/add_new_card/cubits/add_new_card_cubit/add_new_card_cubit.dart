import 'package:ecommerce_clean_architecture/features/profile/domain/entities/card_entity/card_entity.dart';
import 'package:ecommerce_clean_architecture/features/profile/domain/repositories/payment_repository/payment_repository.dart';
import 'package:ecommerce_clean_architecture/features/profile/presentation/add_new_card/cubits/add_new_card_cubit/add_new_card_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewCardCubit extends Cubit<AddNewCardState> {
  AddNewCardCubit({required PaymentRepository paymentRepository})
    : _paymentRepository = paymentRepository,
      super(InitialAddNewCardState());

  final PaymentRepository _paymentRepository;

  Future addCard({required CardEntity cardEntity}) async {
    emit(LoadingAddNewCardState());
    var result = await _paymentRepository.addNewCard(card: cardEntity);
    result.fold(
      (failure) => emit(FailureAddNewCardState(errorMessage: failure.message)),
      (result) {
        emit(SuccessAddNewCardState());
      },
    );
  }
}
