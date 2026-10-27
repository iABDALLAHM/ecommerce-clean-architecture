import 'package:ecommerce_clean_architecture/core/models/query_prams.dart';
import 'package:ecommerce_clean_architecture/features/main/domain/repositories/products_repository/products_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/products_cubit/products_states.dart';
import 'package:ecommerce_clean_architecture/features/products/presentation/enums/product_filters/products_filters_enum.dart';
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

  Future getFilterdProducts({required Set<ProductFilters> filters}) async {
    emit(LoadingProductsState());
    final conditions = <QueryCondition>[];

    if (filters.contains(ProductFilters.organic)) {
      conditions.add(
        QueryCondition(field: 'isOrganicProduct', isEqualTo: true),
      );
    }

    if (filters.contains(ProductFilters.lowerThan100EGP)) {
      conditions.add(QueryCondition(field: 'productPrice', isLessThan: 100));
    }

    if (filters.contains(ProductFilters.lowCalories)) {
      conditions.add(QueryCondition(field: 'numberOfCalories', isLessThan: 15));
    }

    if (filters.contains(ProductFilters.highCalories)) {
      conditions.add(
        QueryCondition(field: 'numberOfCalories', isGreaterThan: 14),
      );
    }

    var result = await productsRepository.getFilterdProducts(
      conditions: conditions,
    );

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
