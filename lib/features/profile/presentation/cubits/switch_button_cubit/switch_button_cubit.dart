import 'package:ecommerce_clean_architecture/features/profile/presentation/cubits/switch_button_cubit/switch_button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchButtonCubit extends Cubit<SwitchButtonState> {
  SwitchButtonCubit() : super(SwitchButtonState(currentState: false));

  void changeState(bool value) => emit(state.copyWith(value));
}
