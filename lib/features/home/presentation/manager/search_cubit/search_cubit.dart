import 'package:ecommerce_clean_architecture/core/repos/products_repo/products_repo.dart';
import 'package:ecommerce_clean_architecture/features/home/presentation/manager/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit({required this.productsRepo}) : super(InitialSearchState());
  final ProductsRepo productsRepo;

  Future searchProducts({required String searchName}) async {
    emit(LoadingSearchState());
    var result = await productsRepo.searchProducts(searchName: searchName);
    result.fold(
      (failure) {
        emit(FailureSearchState(errMessage: failure.message));
      },
      (productsList) {
        if (productsList.isEmpty) {
          emit(EmptySearchState());
        } else {
          emit(SuccessSearchState(productsList: productsList));
        }
      },
    );
  }
}
