import 'package:ecommerce_clean_architecture/features/main/presentation/core/cubits/bottom_navigation_cubit/bottom_navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationState(currentPage: 0));

  void changePage({required int currentPage}) =>
      emit(state.copyWith(currentPage));
}
