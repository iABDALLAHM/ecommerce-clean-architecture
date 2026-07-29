import 'package:ecommerce_clean_architecture/features/main/domain/repositories/products_repository/products_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/products_cubit/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit({required this.productsRepository})
    : super(InitialProductsState());

  final ProductsRepository productsRepository;

  Future<void> getProducts() async {
    emit(LoadingProductsState());
    var result = await productsRepository.getProducts();
    result.fold(
      (failure) => emit(FailureProductsState(errorMessage: failure.message)),
      (products) {
        return emit(SuccessProductsState(products: products));
      },
    );
  }

  Future getHighPriceProducts() async {
    emit(LoadingProductsState());
    var result = await productsRepository.getHighPriceProducts();
    result.fold(
      (failure) {
        emit(FailureProductsState(errorMessage: failure.message));
      },
      (result) {
        if (result.isEmpty) {
          emit(EmptyProductsState());
        } else {
          emit(SuccessProductsState(products: result));
        }
      },
    );
  }

  Future getLowPriceProducts() async {
    emit(LoadingProductsState());
    var result = await productsRepository.getLowPriceProducts();
    result.fold(
      (failure) {
        emit(FailureProductsState(errorMessage: failure.message));
      },
      (result) {
        if (result.isEmpty) {
          emit(EmptyProductsState());
        } else {
          emit(SuccessProductsState(products: result));
        }
      },
    );
  }

  Future getProductsSortedByName() async {
    emit(LoadingProductsState());
    var result = await productsRepository.getSortedProductsByName();
    result.fold(
      (failure) {
        emit(FailureProductsState(errorMessage: failure.message));
      },
      (result) {
        if (result.isEmpty) {
          emit(EmptyProductsState());
        } else {
          emit(SuccessProductsState(products: result));
        }
      },
    );
  }
}
