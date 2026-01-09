import 'package:ecommerce_clean_architecture/core/repos/products_repo/products_repo.dart';
import 'package:ecommerce_clean_architecture/core/cubits/products_cubit/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetProductsCubit extends Cubit<GetProductsStates> {
  GetProductsCubit({required this.productsRepo})
    : super(InitialGetProductsState());
  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(LoadingGetProductsState());
    var result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(FailureGetProductsState()),
      (products) => emit(SuccessGetProductsState(products: products)),
    );
  }
}
