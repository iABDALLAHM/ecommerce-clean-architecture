import 'package:ecommerce_clean_architecture/features/main/data/repositories/products_repository/products_repository.dart';
import 'package:ecommerce_clean_architecture/features/main/presentation/home/cubits/products_cubit/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit({required this.productsRepo}) : super(InitialProductsState());

  final ProductsRepository productsRepo;

  Future<void> getProducts() async {
    emit(LoadingProductsState());
    var result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(FailureProductsState(errorMessage: failure.message)),
      (products) {
        return emit(SuccessProductsState(products: products));
      },
    );
  }
}
