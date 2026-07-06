import 'package:ecommerce_clean_architecture/features/main/domain/repositories/products_repository/products_repository.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/cubits/get_filter_products_cubit/get_filter_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetFilterProductsCubit extends Cubit<GetFilterProductsState> {

  GetFilterProductsCubit({required this.productsRepository})
    : super(InitialGetFilterProductsState());

  final ProductsRepository productsRepository;

  Future getHighPriceProducts() async {
    var result = await productsRepository.getHighPriceProducts();
    result.fold(
      (failure) {
        emit(FailureGetFilterProductsState(errorMessage: failure.message));
      },
      (result) {
        if (result.isEmpty) {
          emit(EmptyProductsState());
        } else {
          emit(SuccessGetFilterProductsState(filterProducts: result));
        }
      },
    );
  }

  Future getLowPriceProducts() async {
    var result = await productsRepository.getLowPriceProducts();
    result.fold(
      (failure) {
        emit(FailureGetFilterProductsState(errorMessage: failure.message));
      },
      (result) {
        if (result.isEmpty) {
          emit(EmptyProductsState());
        } else {
          emit(SuccessGetFilterProductsState(filterProducts: result));
        }
      },
    );
  }

  Future getProductsSortedByName() async {
    var result = await productsRepository.getSortedProductsByName();

    result.fold(
      (failure) {
        emit(FailureGetFilterProductsState(errorMessage: failure.message));
      },
      (result) {
        if (result.isEmpty) {
          emit(EmptyProductsState());
        } else {
          emit(SuccessGetFilterProductsState(filterProducts: result));
        }
      },
    );
  }
}
