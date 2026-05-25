import 'package:ecommerce_clean_architecture/features/auth/presentation/manager/terms_and_conditions_cubit/terms_and_conditions_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndConditionsCubit extends Cubit<TermsAndConditionsState> {
  TermsAndConditionsCubit() : super(TermsAndConditionsState(isChecked: false));

  void checkButton({required bool value}) => emit(state.copyWith(value));
}
