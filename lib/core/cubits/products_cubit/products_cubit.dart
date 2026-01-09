import 'package:ecommerce_clean_architecture/core/repos/products_repo/products_repo.dart';
import 'package:ecommerce_clean_architecture/core/cubits/products_cubit/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit({required this.productsRepo}) : super(InitialProductsState());
  final ProductsRepo productsRepo;
  int productsLength = 0;
  Future<void> getProducts() async {
    emit(LoadingProductsState());
    var result = await productsRepo.getProducts();
    result.fold((failure) => emit(FailureProductsState()), (products) {
      productsLength = products.length;
      return emit(SuccessProductsState(products: products));
    });
  }
}
