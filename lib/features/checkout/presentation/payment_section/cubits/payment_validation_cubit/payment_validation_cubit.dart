import 'package:ecommerce_clean_architecture/features/checkout/presentation/payment_section/cubits/payment_validation_cubit/payment_validation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentValidationCubit extends Cubit<PaymentValidationState> {
  PaymentValidationCubit() : super(InitialPaymentValidationState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool validate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(PaymentValidationDoneState());
      return true;
    }
    autovalidateMode = AutovalidateMode.always;
    emit(PaymentValidationFailureState());
    return false;
  }
}
