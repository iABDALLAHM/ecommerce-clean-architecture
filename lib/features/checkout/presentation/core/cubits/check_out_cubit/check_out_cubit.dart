import 'package:ecommerce_clean_architecture/features/checkout/presentation/core/cubits/check_out_cubit/check_out_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutCubit extends Cubit<CheckOutStates> {
  CheckOutCubit() : super(InitialCheckOutState());
}
