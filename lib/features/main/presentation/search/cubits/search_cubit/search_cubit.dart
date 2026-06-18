import 'package:ecommerce_clean_architecture/features/main/data/repositories/products_repository/products_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/search/cubits/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit({required this.productsRepo}) : super(InitialSearchState());
  final ProductsRepository productsRepo;

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
