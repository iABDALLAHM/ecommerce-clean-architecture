import 'package:ecommerce_clean_architecture/features/checkout/presentation/address_section/cubits/address_validation_cubit/address_validation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressValidationCubit extends Cubit<AddressValidationState> {
  AddressValidationCubit() : super(InitialAddressValidationState());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  bool vaildate() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(AddressValidationDoneState());
      return true;
    } else {
      autoValidateMode = AutovalidateMode.always;
      emit(AddressValidationFailureState());
      return false;
    }
  }
}
